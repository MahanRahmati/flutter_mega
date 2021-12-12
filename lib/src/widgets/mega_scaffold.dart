import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

// Based on https://github.com/flutter/samples/blob/master/experimental/web_dashboard/lib/src/widgets/third_party/adaptive_scaffold.dart
class MegaScaffold extends StatelessWidget {
  final MegaHeaderBar headerBar;
  final Widget? body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int>? onNavigationIndexChange;

  const MegaScaffold({
    Key? key,
    this.headerBar = const MegaHeaderBar(),
    this.body,
    required this.currentIndex,
    required this.destinations,
    this.onNavigationIndexChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 960.0) {
      return MegaScaffoldLarge(
        headerBar: headerBar,
        body: body,
        currentIndex: currentIndex,
        destinations: destinations,
        onNavigationIndexChange: onNavigationIndexChange,
      );
    }

    if (MediaQuery.of(context).size.width > 640.0) {
      return MegaScaffoldMedium(
        headerBar: headerBar,
        body: body,
        currentIndex: currentIndex,
        destinations: destinations,
        onNavigationIndexChange: onNavigationIndexChange,
      );
    }

    return MegaScaffoldSmall(
      headerBar: headerBar,
      body: body,
      currentIndex: currentIndex,
      destinations: destinations,
      onNavigationIndexChange: onNavigationIndexChange,
    );
  }
}

class AdaptiveScaffoldDestination {
  final String title;
  final IconData icon;
  final Widget badge;
  final Color accentColor;

  const AdaptiveScaffoldDestination({
    required this.title,
    required this.icon,
    this.badge = const SizedBox.shrink(),
    this.accentColor = MegaStyle.accentColor1,
  });
}
