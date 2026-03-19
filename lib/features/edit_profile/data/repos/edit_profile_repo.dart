import 'dart:io';

import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../services/edit_profile_api_service.dart';

class EditProfileRepo {
  final EditProfileApiService _service;

  EditProfileRepo(this._service);

  Future<ApiResult<void>> updateProfile(Map<String, dynamic> data) async {
    try {
      await _service.updateProfile(data);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> uploadAvatar(String userId, File file) async {
    try {
      final url = await _service.uploadAvatar(userId, file);
      return ApiResult.success(url);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> deleteAvatar(String userId) async {
    try {
      await _service.deleteAvatar(userId);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
