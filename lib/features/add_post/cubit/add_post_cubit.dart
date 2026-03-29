import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/community/data/repos/community_repo.dart';
import 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final CommunityRepo _repo;
  final PostModel? _existingPost;

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

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

    final catIndex = _categoryValues.indexOf(post.postCategory);
    return catIndex >= 0 ? catIndex : null;
  }

  Future<void> createPost(int selectedCategoryIndex) async {
    if (!formKey.currentState!.validate()) return;
    if (selectedCategoryIndex < 0) return;

    emit(const AddPostState.loading());

    final result = await _repo.createPost(
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      category: _categoryValues[selectedCategoryIndex],
    );

    result.when(
      success: (_) => emit(const AddPostState.success()),
      failure: (error) =>
          emit(AddPostState.failure(error.message ?? 'An error occurred')),
    );
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

    final result = await _repo.updatePost(postId: post.postId, data: data);

    result.when(
      success: (_) => emit(const AddPostState.success()),
      failure: (error) =>
          emit(AddPostState.failure(error.message ?? 'An error occurred')),
    );
  }

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    return super.close();
  }
}
