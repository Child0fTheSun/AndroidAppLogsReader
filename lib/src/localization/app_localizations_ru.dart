// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get titleHomeScreen => 'LogCat Reader';

  @override
  String get openFile => 'Открыть файл';

  @override
  String get titleHistory => 'История';

  @override
  String get titleSettings => 'Настройки';

  @override
  String get filterHistory => 'История фильтрации';

  @override
  String get clearFilter => 'Очистить фильтр';

  @override
  String get noFileOpened => 'Файл не открыт';

  @override
  String get noLogFound => 'Логи не найдены';

  @override
  String get search => 'Поиск';

  @override
  String get errorLoadingFile => 'Ошибка загрузки файла';

  @override
  String get openLogFile => 'Открыть файл';

  @override
  String get scrollToTop => 'Вверх';

  @override
  String get searchHint => 'package:com.example tag:MyTag or text';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get errorLoadingHistory => 'Ошибка загрузки истории';

  @override
  String get noHistory => 'История пуста';

  @override
  String get openLogcatiFiles => 'Открыть файлы Logcat';

  @override
  String get removeFromHistory => 'Удалить из истории';

  @override
  String get fileNotFoundAndRemoved => 'Файл не найден. Удален из истории';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get language => 'Язык';

  @override
  String get theme => 'Тема';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Темная';

  @override
  String get system => 'Системная';

  @override
  String get about => 'О приложении';

  @override
  String get version => 'Версия';

  @override
  String get applicationIcon => 'Иконка приложения';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get appDescription =>
      'Мощный читатель файлов logcat для журналов Android Studio';
}
