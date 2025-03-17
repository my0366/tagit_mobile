import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tagit_mobile/entities/goal/create_goal_dto.dart';

part 'create_goal_state.freezed.dart';

@freezed
class CreateGoalState with _$CreateGoalState {
  const factory CreateGoalState({
    CreateGoalDto? createGoalDto,
  }) = _CreateGoalState;
}
