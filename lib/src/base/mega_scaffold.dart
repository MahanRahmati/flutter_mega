import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

// Based on https://github.com/flutter/samples/blob/master/experimental/web_dashboard/lib/src/widgets/third_party/adaptive_scaffold.dart
class MegaScaffold extends StatelessWidget {
  final MegaHeaderBar headerBar;
  final Widget body;
  final int? selectedIndex;
  final List<NavigationItem>? items;
  final ValueChanged<int>? onItemSelected;

  const MegaScaffold({
    Key? key,
    this.headerBar = const MegaHeaderBar(),
    required this.body,
    this.selectedIndex,
    this.items,
    this.onItemSelected,
  }) : super(key: key);

  void _itemTapped(NavigationItem navigationItem) {
    if (items != null) {
      var idx = items!.indexOf(navigationItem);
      if (idx != selectedIndex) onItemSelected!(idx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor(context)),
      child: Column(
        children: [
          headerBar,
          Expanded(
            child: Row(
              children: [
                if (deviceWidth(context) > 640.0 && items != null)
                  AnimatedContainer(
                    width: deviceWidth(context) > 960.0
                        ? MegaStyle.sideBarWidth
                        : MegaStyle.sideBarCompactWidth,
                    duration: MegaStyle.basicDuration,
                    curve: MegaStyle.basicCurve,
                    decoration: BoxDecoration(color: sideColor(context)),
                    child: Column(
                      children: items!.map((item) {
                        var index = items!.indexOf(item);
                        return MegaSideBarItem(
                          icon: item.icon,
                          title: item.title,
                          badge: item.badge,
                          selected: index == selectedIndex,
                          onPressed: () => _itemTapped(item),
                          compact: deviceWidth(context) < 960.0,
                        );
                      }).toList(),
                    ),
                  ),
                if (deviceWidth(context) > 640.0 && items != null)
                  const MegaVerticalDivider(),
                Expanded(child: body),
              ],
            ),
          ),
          if (deviceWidth(context) < 640.0 && items != null)
            const MegaHorizontalDivider(),
          if (deviceWidth(context) < 640.0 && items != null)
            Container(
              height: MegaStyle.bottomBarHeight,
              width: double.infinity,
              decoration: BoxDecoration(color: headerColor(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items!.map((item) {
                  var index = items!.indexOf(item);
                  return MegaBottomNavigationBarItem(
                    icon: item.icon,
                    title: item.title,
                    badge: item.badge,
                    selected: index == selectedIndex,
                    onPressed: () => _itemTapped(item),
                    compact: items!.length > 4,
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class NavigationItem {
  final String title;
  final IconData icon;
  final Widget badge;
  final Color accentColor;

  const NavigationItem({
    required this.title,
    required this.icon,
    this.badge = const SizedBox.shrink(),
    this.accentColor = MegaStyle.accentColor1,
  });
}
