import 'package:as_app_logs_reader/core/constants/app_constants.dart';
import 'package:as_app_logs_reader/core/constants/assets.dart';
import 'package:as_app_logs_reader/core/utils/s.dart';
import 'package:as_app_logs_reader/src/localization/app_localizations.dart';
import 'package:as_app_logs_reader/ui/screens/settings/settings_screen_view_model.dart';
import 'package:as_app_logs_reader/ui/widgets/app_toolbar.dart';
import 'package:as_app_logs_reader/ui/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// The settings screen of the application
///
/// Allows the user to configure application settings such as language and theme.
/// Also displays information about the application
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);

    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = SettingsScreenViewModel();
        viewModel.initialize();
        return viewModel;
      },
      child: Consumer<SettingsScreenViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppToolbar(
              title: localizations.titleSettings,
              showBackButton: true,
            ),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      // Appearance Section
                      _buildSectionHeader(context, localizations.appearance),
                      _buildLanguageTile(context, viewModel, localizations),
                      _buildThemeSection(context, viewModel, localizations),

                      const Divider(height: 16, indent: 16, endIndent: 16),

                      // About Section
                      _buildSectionHeader(context, localizations.about),
                      _buildAboutSection(context, viewModel, localizations),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildLanguageTile(
    BuildContext context,
    SettingsScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    return ListTile(
      leading: SvgIcon(
        assetPath: Assets.icLanguage,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(localizations.language),
      subtitle: Text(
        viewModel.getLanguageDisplayName(viewModel.selectedLanguage),
      ),
      trailing: SvgIcon(
        assetPath: Assets.icArrowForwardIos,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onTap: () {
        _showLanguageBottomSheet(context, viewModel, localizations);
      },
    );
  }

  Widget _buildThemeSection(
    BuildContext context,
    SettingsScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    return Column(
      children: [
        ListTile(
          leading: SvgIcon(
            assetPath: Assets.icPalette,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(localizations.theme),
        ),
        RadioListTile<ThemeMode>(
          title: Text(localizations.light),
          value: ThemeMode.light,
          groupValue: viewModel.selectedTheme,
          onChanged: (value) {
            if (value != null) {
              viewModel.setTheme(value);
            }
          },
          secondary: SvgIcon(
            assetPath: Assets.icLightMode,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        RadioListTile<ThemeMode>(
          title: Text(localizations.dark),
          value: ThemeMode.dark,
          groupValue: viewModel.selectedTheme,
          onChanged: (value) {
            if (value != null) {
              viewModel.setTheme(value);
            }
          },
          secondary: SvgIcon(
            assetPath: Assets.icDarkMode,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        RadioListTile<ThemeMode>(
          title: Text(localizations.system),
          value: ThemeMode.system,
          groupValue: viewModel.selectedTheme,
          onChanged: (value) {
            if (value != null) {
              viewModel.setTheme(value);
            }
          },
        ),
      ],
    );
  }

  void _showLanguageBottomSheet(
    BuildContext context,
    SettingsScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  localizations.selectLanguage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ...viewModel.getAvailableLanguages().map((languageCode) {
                final isSelected = viewModel.selectedLanguage == languageCode;
                return ListTile(
                  leading: isSelected
                      ? SvgIcon(
                          assetPath: Assets.icCheck,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : const SizedBox(width: 24),
                  title: Text(viewModel.getLanguageDisplayName(languageCode)),
                  onTap: () {
                    viewModel.setLanguage(languageCode);
                    Navigator.pop(context);
                  },
                );
              }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutSection(
    BuildContext context,
    SettingsScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgIcon(
                assetPath: Assets.icInfo,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.appName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${localizations.version} ${viewModel.appVersion}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: _launchGithubUrl,
                icon: SvgIcon(
                  assetPath: Assets.icGithub,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                tooltip: 'GitHub',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            localizations.appDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Future<void> _launchGithubUrl() async {
    final Uri url = Uri.parse(
      'https://github.com/Child0fTheSun/as_app_logs_reader',
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
