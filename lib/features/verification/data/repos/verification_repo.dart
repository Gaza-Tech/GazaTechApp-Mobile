import 'dart:io';

import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/verification/data/models/verification_request_model.dart';
import 'package:gaza_tech/features/verification/data/services/verification_api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerificationRepo {
  final VerificationApiService _apiService;

  VerificationRepo(this._apiService);

  Future<ApiResult<VerificationRequestModel?>> getLatestRequest() async {
    try {
      final data = await _apiService.fetchLatestRequest();
      if (data == null) return ApiResult.success(null);
      return ApiResult.success(VerificationRequestModel.fromJson(data));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> uploadDocument({
    required String userId,
    required File file,
    required String documentName,
  }) async {
    try {
      final url = await _apiService.uploadDocument(
        userId: userId,
        file: file,
        documentName: documentName,
      );
      return ApiResult.success(url);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<VerificationRequestModel>> submitRequest(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await _apiService.submitRequest(data);
      return ApiResult.success(VerificationRequestModel.fromJson(result));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> sendPhoneOtp(String phone) async {
    try {
      await _apiService.sendPhoneOtp(phone);
      return ApiResult.success(null);
    } on AuthException catch (e) {
      // Allow reusing the same phone number during testing
      if (e.message.contains('already been registered')) {
        return ApiResult.success(null);
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> verifyPhoneOtp({
    required String phone,
    required String token,
  }) async {
    try {
      await _apiService.verifyPhoneOtp(phone: phone, token: token);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> updatePhoneVerified({
    required String userId,
    required String requestId,
    required String phone,
  }) async {
    try {
      await _apiService.updateUserPhone(userId: userId, phone: phone);
      await _apiService.updatePhoneVerified(requestId);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
