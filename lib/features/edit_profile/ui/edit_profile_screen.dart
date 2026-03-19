import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
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
                return TextButton(
                  onPressed: () =>
                      context.read<EditProfileCubit>().saveProfile(),
                  child: Text(context.l10n.saveChanges),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            final cubit = context.read<EditProfileCubit>();
            return SingleChildScrollView(
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
                    TextFormField(
                      controller: cubit.firstNameController,
                      decoration: InputDecoration(
                        labelText: context.l10n.firstName,
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? context.l10n.required
                          : null,
                    ),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.lastNameController,
                      decoration: InputDecoration(
                        labelText: context.l10n.lastName,
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? context.l10n.required
                          : null,
                    ),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.bioController,
                      decoration: InputDecoration(
                        labelText: context.l10n.bio,
                        hintText: context.l10n.bioHint,
                      ),
                      maxLines: 3,
                    ),
                    const VerticalSpace(24),

                    // Contact Info
                    _SectionHeader(label: context.l10n.contactInfo),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.phoneNumberController,
                      decoration: InputDecoration(
                        labelText: context.l10n.phoneNumber,
                        prefixIcon: const Icon(Icons.phone_outlined),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.whatsappNumberController,
                      decoration: InputDecoration(
                        labelText: context.l10n.whatsappNumber,
                        prefixIcon: const Icon(Icons.chat_outlined),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const VerticalSpace(24),

                    // Social Links
                    _SectionHeader(label: context.l10n.socialLinks),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.facebookLinkController,
                      decoration: InputDecoration(
                        labelText: context.l10n.facebookLink,
                        prefixIcon: const Icon(Icons.facebook),
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.instagramLinkController,
                      decoration: InputDecoration(
                        labelText: context.l10n.instagramLink,
                        prefixIcon: const Icon(Icons.camera_alt_outlined),
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.twitterLinkController,
                      decoration: InputDecoration(
                        labelText: context.l10n.twitterLink,
                        prefixIcon: const Icon(Icons.alternate_email),
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    const VerticalSpace(12),
                    TextFormField(
                      controller: cubit.websiteLinkController,
                      decoration: InputDecoration(
                        labelText: context.l10n.websiteLink,
                        prefixIcon: const Icon(Icons.language),
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(height: 40.h),
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
