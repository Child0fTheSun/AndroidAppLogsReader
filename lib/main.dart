import 'package:as_app_logs_reader/core/constants/app_constants.dart';
import 'package:as_app_logs_reader/core/di/service_locator.dart' as di;
import 'package:as_app_logs_reader/data/services/locale_service.dart';
import 'package:as_app_logs_reader/data/services/theme_service.dart';
import 'package:as_app_logs_reader/core/theme/app_theme.dart';
import 'package:as_app_logs_reader/core/utils/s.dart';
import 'package:as_app_logs_reader/ui/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Application entry point.
///
/// Sets up orientation, initializes bindings, dependency injection, and runs the app
void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();

  di.setupServices(di.getIt);

  runApp(MyApp());
}

/// The root widget of the application
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocaleService _localeService;
  late final ThemeService _themeService;

  @override
  void initState() {
    super.initState();

    _localeService = di.getIt<LocaleService>();
    _themeService = di.getIt<ThemeService>();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(navigatorKey: navigatorKey);

    return ValueListenableBuilder<Locale>(
      valueListenable: _localeService.localeNotifier,
      builder: (context, locale, _) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: _themeService.themeModeNotifier,
          builder: (context, themeMode, _) {
            return MaterialApp.router(
              title: AppConstants.appName,
              routerConfig: appRouter.router,
              locale: locale,
              themeMode: themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              debugShowCheckedModeBanner: false,
              supportedLocales: S.supportedLocales,
              localizationsDelegates: S.localizationDelegates,
            );
          },
        );
      },
    );
  }
}
