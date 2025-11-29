import 'package:as_app_logs_reader/ui/routes/app_routes.dart';
import 'package:as_app_logs_reader/ui/screens/history/history_screen.dart';
import 'package:as_app_logs_reader/ui/screens/home/home_screen.dart';
import 'package:as_app_logs_reader/ui/screens/settings/settings_screent.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Manages application routing configuration using [GoRouter]
class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey;

  late final GoRouter router;

  AppRouter({required this.navigatorKey}) {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppRoutes.home,
      routes: [
        // Home screen
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          pageBuilder: (context, state) => _buildPageWithSlideTransition(
            context: context,
            state: state,
            child: const HomeScreen(),
          ),
        ),

        // History screen
        GoRoute(
          path: AppRoutes.history,
          name: 'history',
          pageBuilder: (context, state) => _buildPageWithSlideTransition(
            context: context,
            state: state,
            child: const HistoryScreen(),
          ),
        ),

        // Settings screen
        GoRoute(
          path: AppRoutes.settings,
          name: 'settings',
          pageBuilder: (context, state) => _buildPageWithSlideTransition(
            context: context,
            state: state,
            child: const SettingsScreen(),
          ),
        ),
      ],
    );
  }

  /// Creates a page with a sliding animation
  ///
  /// Used for transitions between application screens.
  /// The page animates in from right to left.
  ///
  /// [context] - The build context.
  /// [state] - The current route state.
  /// [child] - The widget to display.
  ///
  /// Returns a [CustomTransitionPage] with a slide transition
  static CustomTransitionPage _buildPageWithSlideTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
