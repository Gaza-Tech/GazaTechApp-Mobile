import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/google_auth_repo.dart';
import 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final GoogleAuthRepo _googleAuthRepo;
  GoogleAuthCubit(this._googleAuthRepo)
    : super(const GoogleAuthState.initial());

  Future<void> signInWithGoogle() async {
    emit(const GoogleAuthState.loading());

    final result = await _googleAuthRepo.signInWithGoogle();

    result.when(
      success: (response) async {
        if (response.user != null) {
          final email = response.user!.email ?? '';
          final checkResult = await _googleAuthRepo.checkEmailAvailability(
            email,
          );
          final status = checkResult.whenOrNull(success: (s) => s);
          if (status == 'banned') {
            await _googleAuthRepo.signOut();
            emit(const GoogleAuthState.accountBanned());
          } else {
            emit(const GoogleAuthState.success());
          }
        } else {
          emit(
            const GoogleAuthState.failure("Sign-in failed: No user returned"),
          );
        }
      },
      failure: (error) {
        final message = error.message ?? "Unknown error";
        if (message.toLowerCase().contains('cancelled')) {
          emit(const GoogleAuthState.cancelled());
        } else {
          emit(GoogleAuthState.failure(message));
        }
      },
    );
  }
}
