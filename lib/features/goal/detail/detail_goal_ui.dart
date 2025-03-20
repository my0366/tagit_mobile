import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/shared/data/local/constant.dart';
import 'package:tagit_mobile/shared/utili/colors.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';
import 'package:tagit_mobile/widgets/tag_widget.dart';

class DetailGoalUi extends ConsumerWidget {
  const DetailGoalUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorExtension.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("dd", style: getShadTextTheme(context).h3),
              TagWidget(),
            ],
          ),
          Text("dd", style: getShadTextTheme(context).p),
          Wrap(
            spacing: 8,
            children: [
              TagWidget(),
              TagWidget(),
              TagWidget(),
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorExtension.backgroundColor,
              border: Border.all(color: ColorExtension.borderColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text("목표 달성률", style: getShadTextTheme(context).large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("현재 진행률", style: getShadTextTheme(context).muted),
                    Text("75%", style: getShadTextTheme(context).muted),
                  ],
                ),
                ShadProgress(
                  value: 0.5,
                  minHeight: 8,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorExtension.backgroundColor,
              border: Border.all(color: ColorExtension.borderColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text("주간 기록", style: getShadTextTheme(context).large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: Const.days
                      .map((e) => _buildDayWidget(context, e))
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDayWidget(BuildContext context, String day) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: getShadColorScheme(context).primary,
      ),
      child: Text(
        day,
        style: getShadTextTheme(context)
            .small
            .copyWith(color: getShadColorScheme(context).background),
      ),
    );
  }
}
