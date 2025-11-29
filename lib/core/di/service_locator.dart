import 'package:as_app_logs_reader/data/services/file_picker_service.dart';
import 'package:as_app_logs_reader/data/services/locale_service.dart';
import 'package:as_app_logs_reader/data/services/log_file_parser_service.dart';
import 'package:as_app_logs_reader/data/services/storage_service.dart';
import 'package:as_app_logs_reader/data/services/theme_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

/// Sets up dependency injection for services.
///
/// Registers all services as singletons or lazy singletons in [GetIt]
void setupServices(GetIt getIt) {
  // Services
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<LocaleService>(LocaleService());
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerLazySingleton<FilePickerService>(() => FilePickerService());
  getIt.registerLazySingleton<LogFileParserService>(
    () => LogFileParserService(),
  );
}
