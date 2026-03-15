import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/community/data/repos/community_repo.dart';
import 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final CommunityRepo _repo;

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  static const List<String> _categoryValues = [
    'questions',
    'tips',
    'news',
    'troubleshooting',
  ];

  AddPostCubit(this._repo) : super(const AddPostState.initial());

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

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    return super.close();
  }
}
