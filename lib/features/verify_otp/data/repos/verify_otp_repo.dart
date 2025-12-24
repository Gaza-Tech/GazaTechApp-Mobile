import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../models/verify_otp_request_body.dart';
import '../services/verify_otp_api_service.dart';

class VerifyOtpRepo {
  final VerifyOtpApiService _apiService;
  VerifyOtpRepo(this._apiService);

  Future<ApiResult<AuthResponse>> verifyOtp(VerifyOtpRequestBody body) async {
    try {
      final response = await _apiService.verifyOtp(body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
