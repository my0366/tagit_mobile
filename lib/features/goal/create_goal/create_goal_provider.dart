import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/entities/goal/create_goal_dto.dart';
import 'package:tagit_mobile/features/goal/create_goal/create_goal_state.dart';
import 'package:tagit_mobile/shared/data/index.dart';

part 'create_goal_provider.g.dart';

@riverpod
class CreateGoalNotifier extends _$CreateGoalNotifier {
  @override
  CreateGoalState build() {
    return CreateGoalState();
  }

  Future<dynamic> createGoal() async {
    if (state.createGoalDto == null) {
      return null;
    }
    var result = await ref.read(goalsRepositoryProvider).postCreateGoal(state.createGoalDto!);
    return result;
  }

  Future<void> updateCreateGoalDto(Map<Object, dynamic> value) async {
    final CreateGoalDto dto = CreateGoalDto(
      title: value['title'],
      content: value['content'],
      isWeeklyGoal: value['isWeeklyGoal'],
      startDate: value['range'].start,
      endDate: value['range'].end,
    );
    state = state.copyWith(createGoalDto: dto);
  }
}
