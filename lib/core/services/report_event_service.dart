import 'dart:async';

import 'package:gaza_tech/features/report/data/models/report_reason.dart';

class ReportEvent {
  final ReportEntityType entityType;
  final String entityId;
  final bool isReported;

  const ReportEvent({
    required this.entityType,
    required this.entityId,
    required this.isReported,
  });
}

class ReportEventService {
  final StreamController<ReportEvent> _controller =
      StreamController<ReportEvent>.broadcast();

  Stream<ReportEvent> get reportChanges => _controller.stream;

  void emitReport(
    ReportEntityType entityType,
    String entityId, {
    required bool isReported,
  }) {
    _controller.add(
      ReportEvent(
        entityType: entityType,
        entityId: entityId,
        isReported: isReported,
      ),
    );
  }

  void dispose() {
    _controller.close();
  }
}
