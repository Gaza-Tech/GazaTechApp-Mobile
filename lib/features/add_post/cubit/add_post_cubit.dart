import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/helpers/image_compress_helper.dart';
import 'package:gaza_tech/core/models/image_item.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/community/data/repos/community_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final CommunityRepo _repo;
  final PostModel? _existingPost;

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  List<ImageItem> attachments = [];

  static const int maxAttachments = 4;

  static const List<String> _categoryValues = [
    'questions',
    'tips',
    'news',
    'troubleshooting',
  ];

  AddPostCubit(this._repo, [this._existingPost])
    : super(const AddPostState.initial());

  bool get isEditMode => _existingPost != null;

  /// Pre-populate form for edit mode. Returns the category index.
  int? initializeForEdit() {
    final post = _existingPost;
    if (post == null) return null;

    titleController.text = post.title;
    contentController.text = post.content;
    attachments = post.attachmentUrls
        .map<ImageItem>((url) => ExistingImage(url))
        .toList();

    final catIndex = _categoryValues.indexOf(post.postCategory);
    return catIndex >= 0 ? catIndex : null;
  }

  Future<void> createPost(int selectedCategoryIndex) async {
    if (!formKey.currentState!.validate()) return;
    if (selectedCategoryIndex < 0) return;

    emit(const AddPostState.loading());

    final createResult = await _repo.createPost(
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      category: _categoryValues[selectedCategoryIndex],
    );

    switch (createResult) {
      case Success(data: final postId):
        await _uploadAttachments(postId);
      case Failure(error: final error):
        emit(AddPostState.failure(error.message ?? 'An error occurred'));
    }
  }

  Future<void> updatePost(int selectedCategoryIndex) async {
    final post = _existingPost;
    if (post == null) return;
    if (!formKey.currentState!.validate()) return;
    if (selectedCategoryIndex < 0) return;

    emit(const AddPostState.loading());

    final data = <String, dynamic>{
      'title': titleController.text.trim(),
      'content': contentController.text.trim(),
      'post_category': _categoryValues[selectedCategoryIndex],
    };

    final updateResult = await _repo.updatePost(
      postId: post.postId,
      data: data,
    );

    switch (updateResult) {
      case Success():
        await _handleAttachmentUpdate(post);
      case Failure(error: final error):
        emit(AddPostState.failure(error.message ?? 'An error occurred'));
    }
  }

  Future<void> _uploadAttachments(String postId) async {
    final newFiles = attachments.whereType<NewImage>().toList();
    if (newFiles.isEmpty) {
      emit(const AddPostState.success());
      return;
    }

    final authorId = Supabase.instance.client.auth.currentUser!.id;
    final compressed = await ImageCompressHelper.compressMultipleToWebp(
      newFiles.map((e) => e.file).toList(),
    );

    final uploadResult = await _repo.uploadPostImages(
      authorId: authorId,
      postId: postId,
      images: compressed,
    );

    switch (uploadResult) {
      case Success(data: final urls):
        final saveResult = await _repo.savePostAttachments(
          postId: postId,
          imageUrls: urls,
        );
        switch (saveResult) {
          case Success():
            emit(const AddPostState.success());
          case Failure(error: final error):
            emit(
              AddPostState.failure(
                error.message ?? 'Failed to save attachments',
              ),
            );
        }
      case Failure(error: final error):
        emit(AddPostState.failure(error.message ?? 'Failed to upload images'));
    }
  }

  Future<void> _handleAttachmentUpdate(PostModel post) async {
    final originalUrls = post.attachmentUrls;
    final currentExisting = attachments
        .whereType<ExistingImage>()
        .map((e) => e.url)
        .toList();
    final newFiles = attachments.whereType<NewImage>().toList();

    final hasChanges =
        newFiles.isNotEmpty ||
        currentExisting.length != originalUrls.length ||
        !_listsEqual(currentExisting, originalUrls);

    if (!hasChanges) {
      emit(const AddPostState.success());
      return;
    }

    final authorId = Supabase.instance.client.auth.currentUser!.id;

    // Delete old records and storage files
    await _repo.deletePostAttachments(postId: post.postId, authorId: authorId);

    // Collect all final URLs
    final allUrls = <String>[...currentExisting];

    if (newFiles.isNotEmpty) {
      final compressed = await ImageCompressHelper.compressMultipleToWebp(
        newFiles.map((e) => e.file).toList(),
      );
      final uploadResult = await _repo.uploadPostImages(
        authorId: authorId,
        postId: post.postId,
        images: compressed,
      );

      switch (uploadResult) {
        case Success(data: final urls):
          allUrls.addAll(urls);
        case Failure(error: final error):
          emit(
            AddPostState.failure(error.message ?? 'Failed to upload images'),
          );
          return;
      }
    }

    if (allUrls.isNotEmpty) {
      final saveResult = await _repo.savePostAttachments(
        postId: post.postId,
        imageUrls: allUrls,
      );
      switch (saveResult) {
        case Success():
          emit(const AddPostState.success());
        case Failure(error: final error):
          emit(
            AddPostState.failure(error.message ?? 'Failed to save attachments'),
          );
      }
    } else {
      emit(const AddPostState.success());
    }
  }

  bool _listsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    return super.close();
  }
}
