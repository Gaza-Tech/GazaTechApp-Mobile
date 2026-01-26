import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../sign_out/cubit/sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  final SupabaseClient _supabase;

  SignOutCubit(this._supabase) : super(const SignOutState.initial());

  /// Executes the Supabase signOut function.
  Future<void> signOut() async {
    try {
      emit(const SignOutState.loading());
      await _supabase.auth.signOut();
      // Upon successful sign-out, emit the LoggedOut state
      emit(const SignOutState.loggedOut());
    } catch (e) {
      // Handle any potential Supabase sign-out errors
      emit(SignOutState.error(e.toString()));
    }
  }
}
