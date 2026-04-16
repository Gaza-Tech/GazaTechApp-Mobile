import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/sign_out_repo.dart';
import 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  final SignOutRepo _signOutRepo;
  SignOutCubit(this._signOutRepo) : super(const SignOutState.initial());

  Future<void> emitSignOutState() async {
    emit(const SignOutState.loading());

    final result = await _signOutRepo.signOut();

    result.when(
      success: (_) => emit(const SignOutState.success("Sign out Successful")),
      failure: (error) => emit(SignOutState.failure(error.message ?? "Error")),
    );
  }
}
