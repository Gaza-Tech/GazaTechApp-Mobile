import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/verify_otp_request_body.dart';

class VerifyOtpApiService {
  final SupabaseClient _supabase;
  VerifyOtpApiService(this._supabase);

  Future<AuthResponse> verifyOtp(VerifyOtpRequestBody body) async {
    return await _supabase.auth.verifyOTP(
      email: body.email,
      token: body.token,
      type: body.type,
    );
  }

  Future<ResendResponse> resendOtp({
    required String email,
    OtpType type = OtpType.signup,
  }) async {
    return await _supabase.auth.resend(type: type, email: email);
  }
}
