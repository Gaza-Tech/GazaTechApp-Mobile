import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../services/sign_out_api_service.dart';

class SignOutRepo {
  final SignOutApiService _apiService;
  SignOutRepo(this._apiService);

  Future<ApiResult<void>> signOut() async {
    try {
      await _apiService.signOut();
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
