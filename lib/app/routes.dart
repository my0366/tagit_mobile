import 'package:tagit_mobile/pages/goal/create/goal_create_page.dart';
import 'package:tagit_mobile/pages/goal/goal_detall_page.dart';
import 'package:tagit_mobile/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:tagit_mobile/pages/tag/create/tag_create_page.dart';
import 'package:tagit_mobile/pages/tag/tag_detail_page.dart';

final router = GoRouter(
  initialLocation: "/home", // 기본 경로 설정
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/goal/create',
      builder: (context, state) => GoalCreatePage(),
    ),
    GoRoute(
      path: '/goal/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? "";
        return DetailGoalPage(id: int.parse(id));
      },
    ),
    GoRoute(
      path: '/tag/create',
      builder: (context, state) => TagCreatePage(),
    ),
    GoRoute(
      path: '/tag/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? "";
        return DetailTagPage(id: int.parse(id));
      },
    ),
  ],
);
