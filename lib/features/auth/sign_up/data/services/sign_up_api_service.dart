import 'package:gaza_tech/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpApiService {
  final SupabaseClient _supabase;
  SignUpApiService(this._supabase);

  /// Returns 'available', 'banned', or 'taken'.
  Future<String> checkEmailAvailability(String email) async {
    final result = await _supabase.rpc(
      'check_email_availability',
      params: {'email_input': email},
    );
    return result as String;
  }

  Future<AuthResponse> signUp(SignUpRequestBody body) async {
    return await _supabase.auth.signUp(
      email: body.email,
      password: body.password,
      data: {'name': body.name},
    );
  }
}
