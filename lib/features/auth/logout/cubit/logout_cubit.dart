import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final SupabaseClient _supabase;

  LogoutCubit(this._supabase) : super(const LogoutState.initial());

  /// Executes the Supabase signOut function.
  Future<void> logout() async {
    try {
      emit(const LogoutState.loading());
      await _supabase.auth.signOut();
      // Upon successful sign-out, emit the LoggedOut state
      emit(const LogoutState.loggedOut());
    } catch (e) {
      // Handle any potential Supabase sign-out errors
      emit(LogoutState.error(e.toString()));
    }
  }
}
