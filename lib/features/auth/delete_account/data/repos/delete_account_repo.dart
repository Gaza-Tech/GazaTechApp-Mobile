import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../services/delete_account_api_service.dart';

class DeleteAccountRepo {
  final DeleteAccountApiService _apiService;
  DeleteAccountRepo(this._apiService);

  Future<ApiResult<void>> deleteAccount() async {
    try {
      await _apiService.deactivateAccount();
      await _apiService.signOut();
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
