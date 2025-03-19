import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

ShadTextTheme getShadTextTheme(BuildContext context) {
  return ShadTheme.of(context).textTheme;
}

ShadColorScheme getShadColorScheme(BuildContext context) {
  return ShadTheme.of(context).colorScheme;
}
