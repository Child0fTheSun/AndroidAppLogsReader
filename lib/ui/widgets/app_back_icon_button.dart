import 'package:as_app_logs_reader/core/constants/assets.dart';
import 'package:as_app_logs_reader/ui/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackIconButton extends StatelessWidget {
  const AppBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Assets.icArrowBack,
      onPressed: () => GoRouter.of(context).pop(),
    );
  }
}
