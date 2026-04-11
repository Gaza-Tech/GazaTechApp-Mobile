import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/guest_auth_api_service.dart';

class GuestAuthRepo {
  final GuestAuthApiService _apiService;
  GuestAuthRepo(this._apiService);

  Future<ApiResult<AuthResponse>> signInAnonymously() async {
    try {
      final response = await _apiService.signInAnonymously();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
