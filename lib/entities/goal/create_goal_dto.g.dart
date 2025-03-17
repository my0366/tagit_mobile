// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_goal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateGoalDtoImpl _$$CreateGoalDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateGoalDtoImpl(
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      isWeeklyGoal: json['isWeeklyGoal'] as bool? ?? false,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$CreateGoalDtoImplToJson(_$CreateGoalDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'isWeeklyGoal': instance.isWeeklyGoal,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
