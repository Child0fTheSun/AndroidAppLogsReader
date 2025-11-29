import 'package:as_app_logs_reader/core/constants/assets.dart';
import 'package:as_app_logs_reader/core/utils/s.dart';
import 'package:as_app_logs_reader/src/localization/app_localizations.dart';
import 'package:as_app_logs_reader/ui/routes/app_routes.dart';
import 'package:as_app_logs_reader/ui/screens/home/home_screen_view_model.dart';
import 'package:as_app_logs_reader/ui/widgets/app_icon_button.dart';
import 'package:as_app_logs_reader/ui/widgets/app_toolbar.dart';
import 'package:as_app_logs_reader/ui/widgets/log_entry_widget.dart';
import 'package:as_app_logs_reader/ui/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// The main screen of the application.
///
/// Displays the list of logs, allows filtering, and provides access to
/// file picking, history, and settings
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _filterController = TextEditingController();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _filterController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Show button when scrolled down more than 200px
    final shouldShow =
        _scrollController.hasClients && _scrollController.offset > 200;

    if (shouldShow != _showScrollToTop) {
      setState(() {
        _showScrollToTop = shouldShow;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final localizations = S.of(context);

    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = HomeScreenViewModel();
        // Load last opened file if exists
        viewModel.initialize();
        return viewModel;
      },
      child: Consumer<HomeScreenViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppToolbar(
              title: viewModel.fileName ?? localizations.titleHomeScreen,
              showBackButton: false,
              actions: [
                AppIconButton(
                  icon: Assets.icFolderOpen,
                  onPressed: () => viewModel.pickAndLoadFile(),
                  tooltip: localizations.openFile,
                ),
                AppIconButton(
                  icon: Assets.icHistory,
                  onPressed: () async {
                    final result = await router.push(AppRoutes.history);
                    // If a file path was returned, load it
                    if (result is String && result.isNotEmpty) {
                      await viewModel.loadFile(result);
                    }
                  },
                  tooltip: localizations.titleHistory,
                ),
                AppIconButton(
                  icon: Assets.icSettings,
                  onPressed: () {
                    router.push(AppRoutes.settings);
                  },
                  tooltip: localizations.titleSettings,
                ),
              ],
            ),
            body: SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Filter Panel as SliverAppBar bottom
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 0,
                    collapsedHeight: 0,
                    expandedHeight: 0,
                    elevation: 0,
                    scrolledUnderElevation: 3,
                    surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(72),
                      child: _buildFilterPanel(
                        context,
                        viewModel,
                        localizations,
                      ),
                    ),
                  ),

                  // Log List Area
                  _buildSliverLogList(context, viewModel, localizations),
                ],
              ),
            ),
            floatingActionButton: _buildScrollToTopButton(
              context,
              viewModel,
              localizations,
            ),
          );
        },
      ),
    );
  }

  // Filter Panel with Android Studio style syntax
  Widget _buildFilterPanel(
    BuildContext context,
    HomeScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: _filterController,
        decoration: InputDecoration(
          hintText: localizations.searchHint,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgIcon(
              assetPath: Assets.icSearch,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          suffixIcon: AppIconButton(
            icon: Assets.icClear,
            onPressed: () {
              _filterController.clear();
              viewModel.clearFilter();
            },
            tooltip: localizations.clearFilter,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onChanged: viewModel.updateFilter,
      ),
    );
  }

  // Log list area as Sliver
  Widget _buildSliverLogList(
    BuildContext context,
    HomeScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    // Loading state
    if (viewModel.isLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // Error state
    if (viewModel.error != null) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                localizations.errorLoadingFile,
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
        ),
      );
    }

    // Empty state (no file loaded)
    if (!viewModel.hasFile) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(
                assetPath: Assets.icDescription,
                size: 64,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 16),
              Text(
                localizations.noFileOpened,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                localizations.openLogFile,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // No results after filtering
    if (viewModel.filteredLogs.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 64,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 16),
              Text(
                localizations.noLogFound,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Display logs
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return LogEntryWidget(entry: viewModel.filteredLogs[index]);
      }, childCount: viewModel.filteredLogs.length),
    );
  }

  // Scroll to top floating action button
  Widget? _buildScrollToTopButton(
    BuildContext context,
    HomeScreenViewModel viewModel,
    AppLocalizations localizations,
  ) {
    if (!_showScrollToTop || !viewModel.hasFile) return null;

    return FloatingActionButton(
      onPressed: _scrollToTop,
      tooltip: localizations.scrollToTop,
      child: SvgIcon(
        assetPath: Assets.icArrowUpward,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
