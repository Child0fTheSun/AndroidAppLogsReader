import 'package:as_app_logs_reader/ui/widgets/app_back_icon_button.dart';
import 'package:flutter/material.dart';

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final double toolbarHeight;
  final Color? backgroundColor;

  const AppToolbar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.toolbarHeight = kToolbarHeight,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
              child: AppBackIconButton(),
            )
          : null,
      title: Text(title ?? ''),
      centerTitle: false,
      actions: actions
          ?.map(
            (action) => Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: action,
            ),
          )
          .toList(),
      backgroundColor: backgroundColor,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
