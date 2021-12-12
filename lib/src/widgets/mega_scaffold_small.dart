import 'package:flutter/material.dart'; //TODO
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaScaffoldSmall extends StatelessWidget {
  final MegaHeaderBar headerBar;
  final Widget? body;
  final int? currentIndex;
  final List<AdaptiveScaffoldDestination>? destinations;
  final ValueChanged<int>? onNavigationIndexChange;

  const MegaScaffoldSmall({
    Key? key,
    this.headerBar = const MegaHeaderBar(),
    this.body,
    this.currentIndex,
    this.destinations,
    this.onNavigationIndexChange,
  }) : super(key: key);

  void _destinationTapped(AdaptiveScaffoldDestination destination) {
    if (destinations != null) {
      var idx = destinations!.indexOf(destination);
      if (idx != currentIndex) {
        onNavigationIndexChange!(idx);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: backgroundColor(context)),
        child: Column(
          children: [
            headerBar,
            Expanded(child: body!),
            if (destinations != null) const MegaHorizontalDivider(),
            if (destinations != null)
              Container(
                height: MegaStyle.bottomBarHeight,
                width: double.infinity,
                decoration: BoxDecoration(color: headerColor(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var d in destinations!)
                      destinations!.length > 4
                          ? MegaBottomNavigationBarCompactItem(
                              icon: d.icon,
                              badge: d.badge,
                              accentColor: d.accentColor,
                              selected:
                                  destinations!.indexOf(d) == currentIndex,
                              onPressed: () => _destinationTapped(d),
                            )
                          : MegaBottomNavigationBarItem(
                              icon: d.icon,
                              title: d.title,
                              badge: d.badge,
                              accentColor: d.accentColor,
                              selected:
                                  destinations!.indexOf(d) == currentIndex,
                              onPressed: () => _destinationTapped(d),
                            ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
