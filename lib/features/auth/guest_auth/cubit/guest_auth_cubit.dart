import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/guest_auth_repo.dart';
import 'guest_auth_state.dart';

class GuestAuthCubit extends Cubit<GuestAuthState> {
  final GuestAuthRepo _guestAuthRepo;
  GuestAuthCubit(this._guestAuthRepo) : super(const GuestAuthState.initial());

  Future<void> continueAsGuest() async {
    emit(const GuestAuthState.loading());

    final result = await _guestAuthRepo.signInAnonymously();

    result.when(
      success: (response) {
        if (response.user != null) {
          emit(const GuestAuthState.success());
        } else {
          // Empty string signals the listener to use the localized fallback.
          emit(const GuestAuthState.failure(''));
        }
      },
      failure: (error) {
        // `error.message` may be null; the listener will localize the empty
        // case, so we pass through as-is (empty string in that path).
        emit(GuestAuthState.failure(error.message ?? ''));
      },
    );
  }
}
