import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_auth_state.freezed.dart';

@freezed
class GuestAuthState with _$GuestAuthState {
  const factory GuestAuthState.initial() = _Initial;
  const factory GuestAuthState.loading() = Loading;
  const factory GuestAuthState.success() = Success;
  const factory GuestAuthState.failure(String message) = Failure;
}
