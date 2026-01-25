import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_auth_state.freezed.dart';

@freezed
class GoogleAuthState with _$GoogleAuthState {
  const factory GoogleAuthState.initial() = _Initial;
  const factory GoogleAuthState.loading() = Loading;
  const factory GoogleAuthState.success() = Success;
  const factory GoogleAuthState.cancelled() = Cancelled;
  const factory GoogleAuthState.failure(String message) = Failure;
}
