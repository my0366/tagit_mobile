import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagit_mobile/shared/utili/colors.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class DetailTagUi extends ConsumerWidget {
  const DetailTagUi({super.key});

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
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("태그 이름", style: getShadTextTheme(context).h3),
            ],
          ),
          Text("태그", style: getShadTextTheme(context).p),
        ],
      ),
    );
  }
}
