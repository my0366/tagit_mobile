import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/features/tag/detail/tag_detail_ui.dart';
import 'package:tagit_mobile/shared/utili/colors.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class DetailTagPage extends ConsumerStatefulWidget {
  const DetailTagPage({super.key, required this.id});

  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailTagPageState();
}

class _DetailTagPageState extends ConsumerState<DetailTagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            context.pop();
          },
        ),
        backgroundColor: ColorExtension.backgroundColor,
        title: Text("상세 정보", style: getShadTextTheme(context).h4),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DetailTagUi(),
        ),
      ),
    );
  }
}
