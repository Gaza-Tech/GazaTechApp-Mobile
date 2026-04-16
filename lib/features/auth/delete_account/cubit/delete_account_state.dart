import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = _Loading;
  const factory DeleteAccountState.success(String message) = _Success;
  const factory DeleteAccountState.failure(String message) = _Failure;
}
