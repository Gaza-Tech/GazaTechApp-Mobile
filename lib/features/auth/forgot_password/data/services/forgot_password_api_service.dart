import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordApiService {
  final SupabaseClient _supabase;
  ForgotPasswordApiService(this._supabase);

  Future<void> sendPasswordResetEmail(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }
}
