import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/entities/goal/create_goal_dto.dart';
import 'package:tagit_mobile/features/goal/create_goal/create_goal_provider.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class CreateTagUi extends ConsumerStatefulWidget {
  const CreateTagUi({super.key});

  @override
  ConsumerState<CreateTagUi> createState() => _CreateTagUiState();
}

class _CreateTagUiState extends ConsumerState<CreateTagUi> {
  final formKey = GlobalKey<ShadFormState>();
  ShadAutovalidateMode autoValidateMode = ShadAutovalidateMode.disabled;
  bool isFormValid = false;

  // 폼 검증 함수
  Future<void> submit() async {
    setState(() {
      autoValidateMode = ShadAutovalidateMode.onUserInteraction;
    });
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    await ref.read(createGoalNotifierProvider.notifier).updateCreateGoalDto(form.value);
    await ref.read(createGoalNotifierProvider.notifier).createGoal().then((result) {
      switch (result["statusCode"]) {
        case 200:
          showShadDialog(
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ShadDialog(
                closeIcon: SizedBox.shrink(),
                removeBorderRadiusWhenTiny: false,
                title: const Text('알림'),
                description: const Text("목표가 생성되었습니다."),
                actions: [
                  ShadButton(
                    child: Text('Save changes'),
                    onPressed: () {
                      context.pop();
                      context.pop();
                    },
                  )
                ],
              ),
            ),
          );
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ShadForm(
        autovalidateMode: autoValidateMode,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ShadInputFormField(
                      id: 'title',
                      label: const Text('태그이름'),
                      placeholder: const Text('태그이름'),
                      validator: (v) {
                        if (v.isEmpty) {
                          return '태그이름을 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            ShadButton(
              width: double.infinity,
              height: 48,
              child: const Text('목표 생성'),
              onPressed: () {
                submit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
