import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationRealtimeService {
  final SupabaseClient _supabase;
  RealtimeChannel? _channel;
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  NotificationRealtimeService(this._supabase);

  Stream<void> get onNewNotification => _controller.stream;

  void subscribe() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    _channel = _supabase
        .channel('notifications:$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (_) => _controller.add(null),
        )
        .subscribe();
  }

  void unsubscribe() {
    _channel?.unsubscribe();
    _channel = null;
  }

  void dispose() {
    unsubscribe();
    _controller.close();
  }
}
