import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_out_state.freezed.dart';

@freezed
class SignOutState with _$SignOutState {
  const factory SignOutState.initial() = _Initial;
  const factory SignOutState.loading() = _Loading;
  const factory SignOutState.success(String message) = Success;
  const factory SignOutState.failure(String message) = Falure;
}
