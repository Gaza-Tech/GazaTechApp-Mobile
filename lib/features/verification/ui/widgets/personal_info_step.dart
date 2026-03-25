import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/chip_selector.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/cubit/verification_state.dart';

class PersonalInfoStep extends StatelessWidget {
  const PersonalInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerificationCubit>();
    return BlocBuilder<VerificationCubit, VerificationState>(
      buildWhen: (p, c) => p.selectedGenderIndex != c.selectedGenderIndex,
      builder: (context, state) {
        return Form(
          key: cubit.formKeyStep1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFormField(
                controller: cubit.fullNameController,
                hintText: context.l10n.idFullNameHint,
                labelText: context.l10n.idFullName,
                textInputType: TextInputType.name,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? context.l10n.required
                    : null,
              ),
              const VerticalSpace(16),
              _buildDateField(context, cubit),
              const VerticalSpace(16),
              _buildGenderField(context, state, cubit),
              const VerticalSpace(16),
              MyTextFormField(
                controller: cubit.addressController,
                hintText: context.l10n.addressHint,
                labelText: context.l10n.address,
                textInputType: TextInputType.streetAddress,
                maxLines: 2,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? context.l10n.required
                    : null,
              ),
              const VerticalSpace(16),
              MyTextFormField(
                controller: cubit.nationalIdController,
                hintText: context.l10n.nationalIdNumberHint,
                labelText: context.l10n.nationalIdNumber,
                textInputType: TextInputType.text,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? context.l10n.required
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDateField(BuildContext context, VerificationCubit cubit) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.dateOfBirth,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime(1990),
              firstDate: DateTime(1940),
              lastDate: DateTime.now().subtract(const Duration(days: 365 * 15)),
            );
            if (date != null) cubit.selectDateOfBirth(date);
          },
          child: IgnorePointer(
            child: MyTextFormField(
              controller: cubit.dateOfBirthController,
              hintText: context.l10n.selectDateOfBirth,
              textInputType: TextInputType.none,
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              validator: (v) => (v == null || v.isEmpty)
                  ? context.l10n.pleaseFillDateOfBirth
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField(
    BuildContext context,
    VerificationState state,
    VerificationCubit cubit,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.gender,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        ChipSelector(
          items: [context.l10n.genderMale, context.l10n.genderFemale],
          selectedIndex: state.selectedGenderIndex == -1
              ? null
              : state.selectedGenderIndex,
          onChanged: (i) => cubit.selectGender(i ?? 0),
        ),
      ],
    );
  }
}
