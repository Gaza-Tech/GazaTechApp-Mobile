import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isAvatarUploading,
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    String? avatarLocalPath,
  }) = _EditProfileState;
}
