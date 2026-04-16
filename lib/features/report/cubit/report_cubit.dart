import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';

import '../data/models/report_reason.dart';
import '../data/repos/report_repo.dart';
import 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepo _repo;

  final descriptionController = TextEditingController();
  ReportReason? selectedReason;

  ReportCubit(this._repo) : super(const ReportState.initial());

  void selectReason(ReportReason reason) {
    selectedReason = reason;
  }

  Future<void> submitReport({
    required ReportEntityType entityType,
    required String entityId,
  }) async {
    if (selectedReason == null) return;

    emit(const ReportState.loading());

    final result = await _repo.submitReport(
      entityType: entityType,
      entityId: entityId,
      reason: selectedReason!.toValue(),
      description: descriptionController.text,
    );

    result.when(
      success: (_) => emit(const ReportState.success()),
      failure: (error) {
        if (error.statusCode == 23505) {
          emit(const ReportState.duplicate());
        } else {
          emit(ReportState.failure(error.message ?? 'Unknown error'));
        }
      },
    );
  }

  @override
  Future<void> close() {
    descriptionController.dispose();
    return super.close();
  }
}
