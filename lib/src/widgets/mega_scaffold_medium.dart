import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaScaffoldMedium extends StatelessWidget {
  final MegaHeaderBar headerBar;
  final Widget? body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int>? onNavigationIndexChange;

  const MegaScaffoldMedium({
    Key? key,
    this.headerBar = const MegaHeaderBar(),
    this.body,
    required this.currentIndex,
    required this.destinations,
    this.onNavigationIndexChange,
  }) : super(key: key);

  void _destinationTapped(AdaptiveScaffoldDestination destination) {
    var idx = destinations.indexOf(destination);
    if (idx != currentIndex) {
      onNavigationIndexChange!(idx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerBar,
        Row(
          children: [
            Container(
              height: double.infinity,
              width: MegaStyle.sideBarCompactWidth,
              decoration: BoxDecoration(color: sideColor(context)),
              child: Column(
                children: [
                  for (var d in destinations)
                    MegaSideBarCompactItem(
                      icon: d.icon,
                      badge: d.badge,
                      accentColor: d.accentColor,
                      selected: destinations.indexOf(d) == currentIndex,
                      onPressed: () => _destinationTapped(d),
                    ),
                ],
              ),
            ),
            const MegaVerticalDivider(),
            Expanded(child: body!),
          ],
        ),
      ],
    );
  }
}
