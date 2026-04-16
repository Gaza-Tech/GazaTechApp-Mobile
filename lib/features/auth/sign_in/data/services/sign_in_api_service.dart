import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/sign_in_request_body.dart';

class SignInApiService {
  final SupabaseClient _supabase;
  SignInApiService(this._supabase);

  /// Returns 'available', 'banned', or 'taken'.
  Future<String> checkEmailAvailability(String email) async {
    final result = await _supabase.rpc(
      'check_email_availability',
      params: {'email_input': email},
    );
    return result as String;
  }

  Future<AuthResponse> login(SignInRequestBody body) async {
    return await _supabase.auth.signInWithPassword(
      email: body.email,
      password: body.password,
    );
  }
}
