import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gaza_tech/core/helpers/image_compress_helper.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:gaza_tech/features/profile/data/models/user_profile_model.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _repo;
  final UserProfileModel _initialProfile;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController bioController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController whatsappNumberController;
  late final TextEditingController facebookLinkController;
  late final TextEditingController instagramLinkController;
  late final TextEditingController twitterLinkController;
  late final TextEditingController websiteLinkController;

  String? _avatarUrl;

  UserProfileModel get initialProfile => _initialProfile;

  EditProfileCubit(this._repo, this._initialProfile)
    : super(const EditProfileState()) {
    firstNameController = TextEditingController(
      text: _initialProfile.firstName,
    );
    lastNameController = TextEditingController(text: _initialProfile.lastName);
    bioController = TextEditingController(text: _initialProfile.bio ?? '');
    phoneNumberController = TextEditingController(
      text: _initialProfile.phoneNumber ?? '',
    );
    whatsappNumberController = TextEditingController(
      text: _initialProfile.whatsappNumber ?? '',
    );
    facebookLinkController = TextEditingController(
      text: _initialProfile.facebookLinkUrl ?? '',
    );
    instagramLinkController = TextEditingController(
      text: _initialProfile.instagramLinkUrl ?? '',
    );
    twitterLinkController = TextEditingController(
      text: _initialProfile.twitterLinkUrl ?? '',
    );
    websiteLinkController = TextEditingController(
      text: _initialProfile.websiteUrl ?? '',
    );
    _avatarUrl = _initialProfile.avatarUrl;
  }

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      emit(state.copyWith(avatarLocalPath: picked.path));
    }
  }

  Future<void> removeAvatar() async {
    emit(state.copyWith(isAvatarUploading: true, errorMessage: ''));
    final result = await _repo.deleteAvatar(_initialProfile.userId);
    result.when(
      success: (_) =>
          emit(state.copyWith(isAvatarUploading: false, avatarLocalPath: null)),
      failure: (error) => emit(
        state.copyWith(
          isAvatarUploading: false,
          errorMessage: error.message ?? '',
        ),
      ),
    );
    _avatarUrl = null;
  }

  Future<void> saveProfile() async {
    if (!formKey.currentState!.validate()) return;

    emit(state.copyWith(isLoading: true, errorMessage: ''));

    // Upload avatar if changed
    if (state.avatarLocalPath != null) {
      emit(state.copyWith(isAvatarUploading: true));
      final originalFile = File(state.avatarLocalPath!);
      final compressedFile = await ImageCompressHelper.compressToWebp(
        originalFile,
        quality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );
      final uploadResult = await _repo.uploadAvatar(
        _initialProfile.userId,
        compressedFile,
      );
      final failed = uploadResult.when(
        success: (url) {
          _avatarUrl = url;
          return false;
        },
        failure: (error) {
          emit(
            state.copyWith(
              isLoading: false,
              isAvatarUploading: false,
              errorMessage: error.message ?? '',
            ),
          );
          return true;
        },
      );
      if (failed) return;
      emit(state.copyWith(isAvatarUploading: false));
    }

    final data = <String, dynamic>{
      'first_name': firstNameController.text.trim(),
      'last_name': lastNameController.text.trim(),
      'bio': bioController.text.trim().isEmpty
          ? null
          : bioController.text.trim(),
      'phone_number': phoneNumberController.text.trim().isEmpty
          ? null
          : phoneNumberController.text.trim(),
      'whatsapp_number': whatsappNumberController.text.trim().isEmpty
          ? null
          : whatsappNumberController.text.trim(),
      'facebook_link_url': facebookLinkController.text.trim().isEmpty
          ? null
          : facebookLinkController.text.trim(),
      'instagram_link_url': instagramLinkController.text.trim().isEmpty
          ? null
          : instagramLinkController.text.trim(),
      'twitter_link_url': twitterLinkController.text.trim().isEmpty
          ? null
          : twitterLinkController.text.trim(),
      'website_url': websiteLinkController.text.trim().isEmpty
          ? null
          : websiteLinkController.text.trim(),
      if (_avatarUrl != null) 'avatar_url': _avatarUrl,
    };

    final result = await _repo.updateProfile(data);
    result.when(
      success: (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
      failure: (error) => emit(
        state.copyWith(isLoading: false, errorMessage: error.message ?? ''),
      ),
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    phoneNumberController.dispose();
    whatsappNumberController.dispose();
    facebookLinkController.dispose();
    instagramLinkController.dispose();
    twitterLinkController.dispose();
    websiteLinkController.dispose();
    return super.close();
  }
}
