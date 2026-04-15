import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../models/notification_model.dart';
import '../services/notification_api_service.dart';

class NotificationsResponse {
  final List<NotificationModel> notifications;
  final bool hasMore;
  const NotificationsResponse({
    required this.notifications,
    required this.hasMore,
  });
}

class NotificationRepo {
  final NotificationApiService _service;

  NotificationRepo(this._service);

  Future<ApiResult<NotificationsResponse>> fetchNotifications(int page) async {
    try {
      final raw = await _service.fetchGroupedNotifications(page);
      final hasMore = raw.length > NotificationApiService.pageSize;
      final items =
          hasMore ? raw.sublist(0, NotificationApiService.pageSize) : raw;
      final notifications =
          items.map((e) => NotificationModel.fromJson(e)).toList();
      return ApiResult.success(
        NotificationsResponse(notifications: notifications, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<int>> fetchUnreadCount() async {
    try {
      return ApiResult.success(await _service.fetchUnreadCount());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> markAllAsRead() async {
    try {
      await _service.markAllAsRead();
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> markGroupAsRead(String groupKey) async {
    try {
      await _service.markGroupAsRead(groupKey);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
