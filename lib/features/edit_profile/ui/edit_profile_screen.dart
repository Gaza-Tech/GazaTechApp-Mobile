import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/form_error_dismisser.dart';
import 'package:gaza_tech/features/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:gaza_tech/features/edit_profile/cubit/edit_profile_state.dart';
import 'package:gaza_tech/features/edit_profile/ui/widgets/avatar_picker.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pop(context, true);
        } else if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.editProfile),
          actions: [
            BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: TextButton(
                    onPressed: () =>
                        context.read<EditProfileCubit>().saveProfile(),
                    child: Text(context.l10n.saveChanges),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            final cubit = context.read<EditProfileCubit>();
            return FormErrorDismisser(
              onDismiss: () => cubit.clearFormErrors(),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar
                      AvatarPicker(
                        networkAvatarUrl: cubit.state.avatarLocalPath == null
                            ? cubit.initialProfile.avatarUrl
                            : null,
                        localAvatarPath: state.avatarLocalPath,
                        onPickAvatar: cubit.pickAvatar,
                      ),
                      const VerticalSpace(8),
                      if (cubit.initialProfile.avatarUrl != null ||
                          state.avatarLocalPath != null)
                        Center(
                          child: TextButton(
                            onPressed: state.isAvatarUploading
                                ? null
                                : cubit.removeAvatar,
                            child: Text(
                              context.l10n.removeAvatar,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        ),
                      const VerticalSpace(24),

                      // Personal Info
                      _SectionHeader(label: context.l10n.personalInfo),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.firstNameController,
                        labelText: context.l10n.firstName,
                        hintText: '',
                        textInputType: TextInputType.name,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? context.l10n.required
                            : null,
                      ),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.lastNameController,
                        labelText: context.l10n.lastName,
                        hintText: '',
                        textInputType: TextInputType.name,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? context.l10n.required
                            : null,
                      ),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.bioController,
                        labelText: context.l10n.bio,
                        hintText: context.l10n.bioHint,
                        textInputType: TextInputType.multiline,
                        maxLines: 3,
                      ),
                      const VerticalSpace(24),

                      // Contact Info
                      _SectionHeader(label: context.l10n.contactInfo),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.phoneNumberController,
                        labelText: context.l10n.phoneNumber,
                        hintText: '',
                        prefixIcon: const Icon(Icons.phone_outlined),
                        textInputType: TextInputType.phone,
                      ),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.whatsappNumberController,
                        labelText: context.l10n.whatsappNumber,
                        hintText: '',
                        prefixIcon: const Icon(Icons.chat_outlined),
                        textInputType: TextInputType.phone,
                      ),
                      const VerticalSpace(24),

                      // Social Links
                      _SectionHeader(label: context.l10n.socialLinks),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.facebookLinkController,
                        labelText: context.l10n.facebookLink,
                        hintText: '',
                        prefixIcon: const Icon(Icons.facebook),
                        textInputType: TextInputType.url,
                      ),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.instagramLinkController,
                        labelText: context.l10n.instagramLink,
                        hintText: '',
                        prefixIcon: const Icon(Icons.camera_alt_outlined),
                        textInputType: TextInputType.url,
                      ),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.twitterLinkController,
                        labelText: context.l10n.twitterLink,
                        hintText: '',
                        prefixIcon: const Icon(Icons.alternate_email),
                        textInputType: TextInputType.url,
                      ),
                      const VerticalSpace(12),
                      MyTextFormField(
                        controller: cubit.websiteLinkController,
                        labelText: context.l10n.websiteLink,
                        hintText: '',
                        prefixIcon: const Icon(Icons.language),
                        textInputType: TextInputType.url,
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 1.2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
