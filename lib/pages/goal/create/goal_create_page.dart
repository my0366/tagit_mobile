import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tagit_mobile/features/goal/create_goal/create_goal_ui.dart';
import 'package:tagit_mobile/shared/utili/colors.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class GoalCreatePage extends ConsumerStatefulWidget {
  const GoalCreatePage({super.key});

  @override
  ConsumerState createState() => _CreateGoalPageState();
}

class _CreateGoalPageState extends ConsumerState<GoalCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            context.pop();
          },
        ),
        backgroundColor: ColorExtension.backgroundColor,
        title: Text("생성하기", style: getShadTextTheme(context).h4),
      ),
      body: CreateGoalUi(),
    );
  }
}
