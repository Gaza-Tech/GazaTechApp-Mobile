import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';

import '../models/report_reason.dart';
import '../services/report_api_service.dart';

class ReportRepo {
  final ReportApiService _service;

  ReportRepo(this._service);

  Future<ApiResult<void>> submitReport({
    required ReportEntityType entityType,
    required String entityId,
    required String reason,
    String? description,
  }) async {
    try {
      await _service.submitReport(
        entityType: entityType,
        entityId: entityId,
        reason: reason,
        description: description,
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
