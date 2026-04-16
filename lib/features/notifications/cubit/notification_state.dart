import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/notifications/data/models/notification_model.dart';

part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationModel> notifications,
    @Default(0) int page,
    @Default(true) bool hasMore,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(0) int unreadCount,
    String? errorMessage,
  }) = _NotificationState;
}
