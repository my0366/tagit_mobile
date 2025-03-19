import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagit_mobile/widgets/goal_item.dart';

class GoalUi extends ConsumerStatefulWidget {
  const GoalUi({super.key});

  @override
  ConsumerState createState() => _GoalUiState();
}

class _GoalUiState extends ConsumerState<GoalUi> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: 50, // null for infinite items
      itemBuilder: (context, index) {
        return GoalItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
    );
  }
}
