import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordApiService {
  final SupabaseClient _supabase;
  ResetPasswordApiService(this._supabase);

  Future<AuthResponse> verifyRecoveryOtp({
    required String email,
    required String token,
  }) async {
    return await _supabase.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.recovery,
    );
  }

  Future<UserResponse> updatePassword(String password) async {
    return await _supabase.auth.updateUser(UserAttributes(password: password));
  }

  Future<ResendResponse> resendRecoveryOtp({required String email}) async {
    return await _supabase.auth.resend(type: OtpType.recovery, email: email);
  }
}
