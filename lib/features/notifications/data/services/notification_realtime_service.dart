import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationRealtimeService {
  final SupabaseClient _supabase;
  RealtimeChannel? _channel;
  Timer? _pollTimer;
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  NotificationRealtimeService(this._supabase);

  Stream<void> get onNewNotification => _controller.stream;

  void subscribe() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    // Realtime subscription (no filter — RLS handles security)
    _channel = _supabase
        .channel('notifications:$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          callback: (_) => _controller.add(null),
        )
        .subscribe();

    // Polling fallback every 30s in case Realtime drops
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _controller.add(null),
    );
  }

  void unsubscribe() {
    _channel?.unsubscribe();
    _channel = null;
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void dispose() {
    unsubscribe();
    _controller.close();
  }
}
