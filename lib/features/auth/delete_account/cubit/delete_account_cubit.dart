import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/delete_account_repo.dart';
import 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountRepo _repo;
  DeleteAccountCubit(this._repo) : super(const DeleteAccountState.initial());

  Future<void> emitDeleteAccountState() async {
    emit(const DeleteAccountState.loading());
    final result = await _repo.deleteAccount();
    result.when(
      success: (_) => emit(const DeleteAccountState.success('Account deleted')),
      failure: (error) =>
          emit(DeleteAccountState.failure(error.message ?? 'Error')),
    );
  }
}
