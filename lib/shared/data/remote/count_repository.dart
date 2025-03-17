import 'package:tagit_mobile/entities/goal/create_goal_dto.dart';
import 'package:tagit_mobile/shared/data/dio_instance.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tagit_mobile/shared/data/remote/dio_client.dart';

part 'count_repository.g.dart';

@Riverpod(keepAlive: true)
GoalsRepository goalsRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return GoalsRepository(dio: dio);
}

class GoalsRepository {
  final Dio dio;

  GoalsRepository({required this.dio});

  Future<dynamic> postCreateGoal(CreateGoalDto createGoalDto) async {
    return DioClient.request(
      dio: dio,
      method: HttpMethod.post,
      path: "/goals",
      body: createGoalDto.toJson(),
    );
  }
}
