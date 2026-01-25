import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/google_auth_api_service.dart';

class GoogleAuthRepo {
  final GoogleAuthApiService _apiService;
  GoogleAuthRepo(this._apiService);

  Future<ApiResult<AuthResponse>> signInWithGoogle() async {
    try {
      final response = await _apiService.signInWithGoogle();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
