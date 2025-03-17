import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_goal_dto.freezed.dart';
part 'create_goal_dto.g.dart';

@freezed
class CreateGoalDto with _$CreateGoalDto {
  const factory CreateGoalDto({
    @Default("") String title,
    @Default("") String content,
    @Default(false) bool isWeeklyGoal,
    required DateTime startDate,
    required DateTime endDate,
  }) = _CreateGoalDto;

  factory CreateGoalDto.fromJson(Map<String, dynamic> json) => _$CreateGoalDtoFromJson(json);
}
