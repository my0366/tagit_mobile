import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/shared/utili/colors.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: getShadColorScheme(context).primary),
      child: Text("태그",
          style: getShadTextTheme(context).small.copyWith(
                color: ShadTheme.of(context).colorScheme.background,
              )),
    );
  }
}
