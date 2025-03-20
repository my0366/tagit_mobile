import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/shared/utili/theme_util.dart';

class TagUi extends ConsumerStatefulWidget {
  const TagUi({super.key});

  @override
  ConsumerState createState() => _TagUiState();
}

class _TagUiState extends ConsumerState<TagUi> {
  void a() {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: const Text('Are you absolutely sure?'),
        description: const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
          ),
        ),
        actions: [
          ShadButton.outline(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ShadButton(
            child: const Text('Continue'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView.separated(
          itemCount: 50, // null for infinite items
          itemBuilder: (context, index) {
            return _buildTagItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16);
          },
        ),
      ),
    );
  }

  Widget _buildTagItem() {
    return InkWell(
      onTap: () {
        context.push("/tag/2");
      },
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: '삭제',
              onPressed: (BuildContext context) {},
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Text(
                "태그이름",
                style: getShadTextTheme(context).h4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
