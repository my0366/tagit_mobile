import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/pages/goal/goal_page.dart';
import 'package:tagit_mobile/pages/tag/tag_page.dart';
import 'package:tagit_mobile/shared/utili/colors.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentIndex = 0;
  final List<Widget> pages = [
    GoalPage(),
    TagPage(),
  ];

  void onChangeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorExtension.backgroundColor,
        centerTitle: false,
        title: Text(currentIndex == 0 ? "목표" : "태그", style: getShadTextTheme(context).h3),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: _buildBottomAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/goal/create");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(icon: Icons.sticky_note_2_rounded, label: '목표', index: 0),
          _buildNavItem(icon: Icons.label, label: '태그', index: 1),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    Color color = currentIndex == index ? ShadTheme.of(context).colorScheme.primary : Colors.grey;
    return GestureDetector(
      onTap: () => onChangeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          Gap(4),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
