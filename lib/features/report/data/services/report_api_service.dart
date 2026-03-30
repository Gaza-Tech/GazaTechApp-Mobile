import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/report_reason.dart';

class ReportApiService {
  final SupabaseClient _supabase;

  ReportApiService(this._supabase);

  Future<void> submitReport({
    required ReportEntityType entityType,
    required String entityId,
    required String reason,
    String? description,
  }) async {
    final userId = _supabase.auth.currentUser!.id;

    final data = <String, dynamic>{
      'reporter_id': userId,
      'reason': reason,
      if (description != null && description.trim().isNotEmpty)
        'description': description.trim(),
    };

    switch (entityType) {
      case ReportEntityType.user:
        data['reported_user_id'] = entityId;
      case ReportEntityType.listing:
        data['reported_listing_id'] = entityId;
      case ReportEntityType.post:
        data['reported_post_id'] = entityId;
      case ReportEntityType.comment:
        data['reported_comment_id'] = entityId;
    }

    await _supabase.from('reports').insert(data);
  }
}
