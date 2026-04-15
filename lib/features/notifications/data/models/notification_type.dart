enum NotificationType {
  postLike('post_like'),
  commentLike('comment_like'),
  postComment('post_comment'),
  commentReply('comment_reply'),
  verificationApproved('verification_approved'),
  verificationRejected('verification_rejected'),
  contentRemoved('content_removed'),
  systemAnnouncement('system_announcement');

  final String value;
  const NotificationType(this.value);

  static NotificationType fromString(String value) {
    return NotificationType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => NotificationType.systemAnnouncement,
    );
  }
}
