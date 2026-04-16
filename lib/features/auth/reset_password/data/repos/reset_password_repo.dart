import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../services/reset_password_api_service.dart';

class ResetPasswordRepo {
  final ResetPasswordApiService _apiService;
  ResetPasswordRepo(this._apiService);

  Future<ApiResult<AuthResponse>> verifyRecoveryOtp({
    required String email,
    required String token,
  }) async {
    try {
      final response = await _apiService.verifyRecoveryOtp(
        email: email,
        token: token,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserResponse>> updatePassword(String password) async {
    try {
      final response = await _apiService.updatePassword(password);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResendResponse>> resendRecoveryOtp(String email) async {
    try {
      final response = await _apiService.resendRecoveryOtp(email: email);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
