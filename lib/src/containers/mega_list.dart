import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaList extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MegaList({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MegaStyle.small,
            child: Text(
              title,
              style: headline6(context),
              textAlign: TextAlign.left,
            ),
          ),
          MegaCard(child: Column(children: children)),
        ],
      ),
    );
  }
}
