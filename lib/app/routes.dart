import 'package:tagit_mobile/pages/goal/create_goal_page/create_goal_page.dart';
import 'package:tagit_mobile/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/home", // 기본 경로 설정
  routes: [
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
    GoRoute(path: '/goal/create', builder: (context, state) => CreateGoalPage()),
  ],
);
