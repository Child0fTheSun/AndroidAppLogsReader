import 'package:as_app_logs_reader/core/constants/assets.dart';
import 'package:as_app_logs_reader/core/utils/s.dart';
import 'package:as_app_logs_reader/src/localization/app_localizations.dart';
import 'package:as_app_logs_reader/ui/screens/history/history_screen_view_model.dart';
import 'package:as_app_logs_reader/ui/widgets/app_toolbar.dart';
import 'package:as_app_logs_reader/ui/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);

    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = HistoryScreenViewModel();
        viewModel.initialize();
        return viewModel;
      },
      child: Consumer<HistoryScreenViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppToolbar(
              title: localizations.titleHistory,
              showBackButton: true,
            ),
            body: _buildBody(context, viewModel, localizations),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    HistoryScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    // Loading state
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error state
    if (viewModel.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              assetPath: Assets.icError,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              localizations.errorLoadingHistory,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              viewModel.error!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Empty state
    if (!viewModel.hasHistory) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              assetPath: Assets.icHistory,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              localizations.noHistory,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              localizations.openLogcatiFiles,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      );
    }

    // File list
    return ListView.builder(
      itemCount: viewModel.fileHistory.length,
      itemBuilder: (context, index) {
        final filePath = viewModel.fileHistory[index];
        final fileName = viewModel.getFileName(filePath);

        return ListTile(
          leading: SvgIcon(
            assetPath: Assets.icDescription,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(fileName, style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text(
            filePath,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: SvgIcon(assetPath: Assets.icDelete),
            onPressed: () async {
              await viewModel.removeFromHistory(filePath);
            },
            tooltip: localizations.removeFromHistory,
          ),
          onTap: () async {
            // Check if file exists
            final fileExists = await viewModel.checkFileExists(filePath);

            if (!fileExists) {
              // Show error and remove from history
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.fileNotFoundAndRemoved),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
              await viewModel.removeFromHistory(filePath);
            } else {
              // Navigate back to home with file path
              if (context.mounted) {
                context.pop(filePath);
              }
            }
          },
        );
      },
    );
  }
}
