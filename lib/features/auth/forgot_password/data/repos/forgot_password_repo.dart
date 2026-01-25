import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../services/forgot_password_api_service.dart';

class ForgotPasswordRepo {
  final ForgotPasswordApiService _apiService;
  ForgotPasswordRepo(this._apiService);

  Future<ApiResult<void>> sendPasswordResetEmail(String email) async {
    try {
      await _apiService.sendPasswordResetEmail(email);
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
