import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaScaffoldSmall extends StatelessWidget {
  final MegaHeaderBar headerBar;
  final Widget? body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int>? onNavigationIndexChange;

  const MegaScaffoldSmall({
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
        Expanded(
          child: Container(color: backgroundColor(context), child: body),
        ),
        const MegaHorizontalDivider(),
        Container(
          height: MegaStyle.bottomBarHeight,
          width: double.infinity,
          decoration: BoxDecoration(color: headerColor(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ],
    );
  }
}
