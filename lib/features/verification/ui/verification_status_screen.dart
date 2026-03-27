import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/cubit/verification_state.dart';

import 'widgets/status_card.dart';

class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.verificationStatusTitle)),
      body: BlocBuilder<VerificationCubit, VerificationState>(
        buildWhen: (p, c) =>
            p.isLoadingRequest != c.isLoadingRequest ||
            p.existingRequest != c.existingRequest ||
            p.errorMessage != c.errorMessage,
        builder: (context, state) {
          if (state.isLoadingRequest) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }
          if (state.existingRequest == null) {
            return const SizedBox.shrink();
          }
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: StatusCard(request: state.existingRequest!),
          );
        },
      ),
    );
  }
}
