import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class CreateGoalUi extends ConsumerStatefulWidget {
  const CreateGoalUi({super.key});

  @override
  ConsumerState<CreateGoalUi> createState() => _CreateGoalUiState();
}

class _CreateGoalUiState extends ConsumerState<CreateGoalUi> {
  final formKey = GlobalKey<ShadFormState>();

  // 폼 검증 함수
  void validateForm() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ShadForm(
        autovalidateMode: ShadAutovalidateMode.always,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ShadInputFormField(
                      id: 'goalName',
                      label: const Text('목표명'),
                      placeholder: const Text('목표명을 입력해주세요.'),
                      onChanged: (v) => validateForm(),
                    ),
                    Gap(40),
                    ShadInputFormField(
                      id: 'content',
                      label: Text('내용'),
                      placeholder: const Text('내용을 입력해주세요.'),
                      onChanged: (v) => validateForm(),
                    ),
                    Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "주간 목표",
                          style: getShadTextTheme(context).small,
                        ),
                        ShadSwitch(
                          value: true,
                          onChanged: (v) => validateForm(),
                        ),
                      ],
                    ),
                    Gap(40),
                    ShadDateRangePickerFormField(
                      width: double.infinity,
                      label: const Text('목표 기간'),
                      onChanged: (v) {
                        validateForm();
                      },
                      validator: (v) {
                        if (v == null) return 'A range of dates is required.';
                        if (v.start == null) {
                          return 'The start date is required.';
                        }
                        if (v.end == null) return 'The end date is required.';
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            ShadButton(
              enabled: formKey.currentState?.validate() ?? false,
              width: double.infinity,
              height: 48,
              child: const Text('목표 생성'),
              onPressed: () {
                if (formKey.currentState!.saveAndValidate()) {
                  print('validation succeeded with ${formKey.currentState!.value}');
                } else {
                  print('validation failed');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
