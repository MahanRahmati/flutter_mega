import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show Icons;
import 'package:mega/mega.dart';

class MegaPortraitLayout extends StatefulWidget {
  final Widget headerBarLeading;
  final Widget headerBarCenter;
  final Widget headerBarTrailing;
  final int selectedIndex;
  final List<NavigationItem> items;
  final ValueChanged<int> onItemSelected;
  final MegaSearchField? searchField;

  const MegaPortraitLayout({
    Key? key,
    required this.headerBarLeading,
    required this.headerBarCenter,
    required this.headerBarTrailing,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
    this.searchField,
  }) : super(key: key);

  @override
  _MegaPortraitLayoutState createState() => _MegaPortraitLayoutState();
}

class _MegaPortraitLayoutState extends State<MegaPortraitLayout> {
  late int _selectedIndex;
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void onTap(int index) {
    _navigator.push(pageRoute(index));
    widget.onItemSelected(index);
    setState(() => _selectedIndex = index);
  }

  CupertinoPageRoute pageRoute(int index) {
    return CupertinoPageRoute(
      builder: (context) {
        final page = widget.items[_selectedIndex];
        return Container(
          decoration: BoxDecoration(color: backgroundColor(context)),
          child: Column(
            children: [
              MegaHeaderBar(
                leading: Row(
                  children: [
                    MegaIconButton(
                      icon: Icons.arrow_back_outlined,
                      onPressed: () {
                        widget.onItemSelected(-1);
                        _navigator.pop(context);
                      },
                    ),
                    widget.headerBarLeading,
                  ],
                ),
                center: Row(
                  children: [
                    Text(page.title, style: headline6(context)),
                    widget.headerBarCenter
                  ],
                ),
                trailing: widget.headerBarTrailing,
              ),
              if (widget.searchField != null) widget.searchField!,
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: MegaStyle.normal,
                      child: page.builder(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigator.maybePop(),
      child: Navigator(
        key: _navigatorKey,
        onGenerateInitialRoutes: (navigator, initialRoute) {
          return [
            CupertinoPageRoute(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(color: backgroundColor(context)),
                  child: Column(
                    children: [
                      const MegaHeaderBar(),
                      SingleChildScrollView(
                        child: Column(
                          children: widget.items.map((item) {
                            var index = widget.items.indexOf(item);
                            return MegaSideBarItem(
                              icon: item.icon,
                              title: item.title,
                              badge: item.badge,
                              selected: index == _selectedIndex,
                              onPressed: () => onTap(index),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (_selectedIndex != -1) pageRoute(_selectedIndex)
          ];
        },
      ),
    );
  }
}
