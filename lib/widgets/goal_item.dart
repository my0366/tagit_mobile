import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';
import 'package:tagit_mobile/widgets/tag_widget.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.push("/goal/${goal.id}");
        context.push("/goal/${2.toInt()}");
      },
      child: ShadCard(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        title: Text('Create project', style: getShadTextTheme(context).p),
        description: const Text('Deploy your new project in one-click.'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(8),
            Row(
              children: [TagWidget()],
            )
          ],
        ),
      ),
    );
  }
}
