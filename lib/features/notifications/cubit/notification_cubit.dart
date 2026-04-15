import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/notifications/data/repos/notification_repo.dart';
import 'package:gaza_tech/features/notifications/data/services/notification_realtime_service.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo _repo;
  final NotificationRealtimeService _realtimeService;
  late final StreamSubscription<void> _realtimeSub;

  NotificationCubit(this._repo, this._realtimeService)
      : super(const NotificationState()) {
    _realtimeSub = _realtimeService.onNewNotification.listen((_) {
      fetchUnreadCount();
    });
  }

  Future<void> fetchNotifications() async {
    emit(
      state.copyWith(
        isLoading: true,
        page: 0,
        notifications: [],
        errorMessage: null,
      ),
    );
    final result = await _repo.fetchNotifications(0);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isLoading: false,
          notifications: response.notifications,
          page: 0,
          hasMore: response.hasMore,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMoreNotifications() async {
    if (state.isLoadingMore || !state.hasMore) return;
    final nextPage = state.page + 1;
    emit(state.copyWith(isLoadingMore: true));
    final result = await _repo.fetchNotifications(nextPage);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isLoadingMore: false,
          notifications: [...state.notifications, ...response.notifications],
          page: nextPage,
          hasMore: response.hasMore,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isLoadingMore: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchUnreadCount() async {
    final result = await _repo.fetchUnreadCount();
    result.when(
      success: (count) => emit(state.copyWith(unreadCount: count)),
      failure: (_) {},
    );
  }

  Future<void> markAllAsRead() async {
    final updated =
        state.notifications.map((n) => n.copyWith(isRead: true)).toList();
    emit(state.copyWith(notifications: updated, unreadCount: 0));
    await _repo.markAllAsRead();
  }

  Future<void> markGroupAsRead(String groupKey) async {
    final updated = state.notifications.map((n) {
      if (n.groupKey == groupKey) return n.copyWith(isRead: true);
      return n;
    }).toList();
    final newUnread = updated.where((n) => !n.isRead).length;
    emit(state.copyWith(notifications: updated, unreadCount: newUnread));
    await _repo.markGroupAsRead(groupKey);
  }

  @override
  Future<void> close() {
    _realtimeSub.cancel();
    return super.close();
  }
}
