import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback? onPressed;
  final String? tooltip;
  final String icon;

  const AppIconButton({
    super.key,
    this.iconColor,
    this.onPressed,
    this.tooltip,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      icon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          iconColor ?? colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}
