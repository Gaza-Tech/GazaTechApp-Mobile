import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationApiService {
  final SupabaseClient _supabase;

  NotificationApiService(this._supabase);

  static const int pageSize = 20;

  Future<List<Map<String, dynamic>>> fetchGroupedNotifications(int page) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final data = await _supabase.rpc(
      'get_grouped_notifications',
      params: {
        'p_user_id': userId,
        'p_page': page,
        'p_page_size': pageSize,
      },
    );

    return List<Map<String, dynamic>>.from(data as List);
  }

  Future<int> fetchUnreadCount() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return 0;

    final data = await _supabase.rpc(
      'get_unread_notification_count',
      params: {'p_user_id': userId},
    );

    return (data as int?) ?? 0;
  }

  Future<void> markAllAsRead() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase.rpc(
      'mark_all_notifications_read',
      params: {'p_user_id': userId},
    );
  }

  Future<void> markGroupAsRead(String groupKey) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase.rpc(
      'mark_notification_group_read',
      params: {'p_user_id': userId, 'p_group_key': groupKey},
    );
  }
}
