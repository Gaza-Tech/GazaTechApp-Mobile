import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/chip_selector.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/add_post/ui/widgets/attachment_picker_box.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  int? _selectedCategoryIndex;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.createPost),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: TextButton(
              onPressed: () {
                // TODO: implement save draft
              },
              child: Text(context.l10n.saveDraft),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Title
              LabeledField(label: context.l10n.postTitle),
              const VerticalSpace(8),
              MyTextFormField(
                controller: _titleController,
                hintText: context.l10n.enterPostTitle,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return context.l10n.required;
                  }
                  return null;
                },
              ),
              const VerticalSpace(16),

              // Category
              LabeledField(label: context.l10n.categoryLabel),
              const VerticalSpace(8),
              ChipSelector(
                items: [
                  context.l10n.questions,
                  context.l10n.tips,
                  context.l10n.news,
                  context.l10n.troubleshooting,
                ],
                selectedIndex: _selectedCategoryIndex,
                onChanged: (index) {
                  setState(() => _selectedCategoryIndex = index);
                },
              ),
              const VerticalSpace(16),

              // Content
              LabeledField(label: context.l10n.content),
              const VerticalSpace(8),
              MyTextFormField(
                controller: _contentController,
                hintText: context.l10n.writeYourPostHere,
                textInputType: TextInputType.multiline,
                minLines: 8,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.w,
                ),
              ),
              const VerticalSpace(16),

              // Attachments
              LabeledField(
                label: context.l10n.attachments,
                isRequired: false,
              ),
              const VerticalSpace(8),
              AttachmentPickerBox(
                onTap: () {
                  // TODO: implement file picker
                },
              ),
              const VerticalSpace(24),

              // Publish Button
              MyButton(
                text: context.l10n.publishPost,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: submit logic
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
