import 'package:tagit_mobile/features/count/count_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeState {
  int count(WidgetRef ref) => ref.watch(countNotifierProvider).count;
}
