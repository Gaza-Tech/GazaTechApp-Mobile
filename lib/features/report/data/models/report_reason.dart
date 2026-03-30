enum ReportEntityType {
  user,
  listing,
  post,
  comment,
}

enum ReportReason {
  spam,
  inappropriateContent,
  harassment,
  misleading,
  fraudScam,
  hateSpeech,
  other;

  String toValue() {
    switch (this) {
      case ReportReason.spam:
        return 'spam';
      case ReportReason.inappropriateContent:
        return 'inappropriate_content';
      case ReportReason.harassment:
        return 'harassment';
      case ReportReason.misleading:
        return 'misleading';
      case ReportReason.fraudScam:
        return 'fraud_scam';
      case ReportReason.hateSpeech:
        return 'hate_speech';
      case ReportReason.other:
        return 'other';
    }
  }
}
