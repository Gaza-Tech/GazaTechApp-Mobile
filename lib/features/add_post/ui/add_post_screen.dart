import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/models/image_item.dart';
import 'package:gaza_tech/core/widgets/image_picker_grid.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/chip_selector.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/add_post/cubit/add_post_cubit.dart';
import 'package:gaza_tech/features/add_post/cubit/add_post_state.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  int? _selectedCategoryIndex;
  List<ImageItem> _attachments = [];

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AddPostCubit>();
    final catIndex = cubit.initializeForEdit();
    if (catIndex != null) {
      _selectedCategoryIndex = catIndex;
    }
    _attachments = List.of(cubit.attachments);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPostCubit>();
    final l10n = context.l10n;
    final isEdit = cubit.isEditMode;

    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  cubit.isDraftEdit
                      ? l10n.postPublished
                      : (isEdit ? l10n.postUpdated : l10n.postPublished),
                ),
              ),
            );
            Navigator.pop(context, true);
          },
          draftSaved: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l10n.draftSaved)));
            Navigator.pop(context, true);
          },
          failure: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? l10n.editPost : l10n.createPost),
          actions: [
            if (!isEdit || cubit.isDraftEdit)
              Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: BlocSelector<AddPostCubit, AddPostState, bool>(
                  selector: (state) =>
                      state.maybeWhen(loading: () => true, orElse: () => false),
                  builder: (context, isLoading) => TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (cubit.isDraftEdit) {
                              cubit.updatePost(
                                _selectedCategoryIndex ?? -1,
                                publish: false,
                              );
                            } else {
                              cubit.saveDraft(_selectedCategoryIndex ?? -1);
                            }
                          },
                    child: Text(
                      cubit.isDraftEdit ? l10n.saveEdit : l10n.saveDraft,
                    ),
                  ),
                ),
              ),
          ],
        ),
        body: BlocBuilder<AddPostCubit, AddPostState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledField(label: l10n.postTitle),
                    const VerticalSpace(8),
                    MyTextFormField(
                      controller: cubit.titleController,
                      hintText: l10n.enterPostTitle,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return l10n.required;
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(16),
                    LabeledField(label: l10n.categoryLabel),
                    const VerticalSpace(8),
                    ChipSelector(
                      items: [
                        l10n.questions,
                        l10n.tips,
                        l10n.news,
                        l10n.troubleshooting,
                      ],
                      selectedIndex: _selectedCategoryIndex,
                      onChanged: (index) {
                        setState(() => _selectedCategoryIndex = index);
                      },
                    ),
                    const VerticalSpace(16),
                    LabeledField(label: l10n.content),
                    const VerticalSpace(8),
                    MyTextFormField(
                      controller: cubit.contentController,
                      hintText: l10n.writeYourPostHere,
                      textInputType: TextInputType.multiline,
                      minLines: 8,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.w,
                      ),
                    ),
                    const VerticalSpace(16),
                    LabeledField(label: l10n.attachments, isRequired: false),
                    const VerticalSpace(8),
                    ImagePickerGrid(
                      images: _attachments,
                      maxImages: AddPostCubit.maxAttachments,
                      onImagesChanged: (updated) {
                        setState(() => _attachments = updated);
                        cubit.attachments = updated;
                      },
                    ),
                    const VerticalSpace(24),
                    MyButton(
                      text: cubit.isDraftEdit
                          ? l10n.publishPost
                          : (isEdit ? l10n.updatePost : l10n.publishPost),
                      onPressed: isLoading
                          ? null
                          : () {
                              final catIndex = _selectedCategoryIndex ?? -1;
                              if (isEdit) {
                                cubit.updatePost(
                                  catIndex,
                                  publish: cubit.isDraftEdit,
                                );
                              } else {
                                cubit.createPost(catIndex);
                              }
                            },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
