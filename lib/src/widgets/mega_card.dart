import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';

class MegaCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const MegaCard({
    Key? key,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: SizedBox(height: height, width: width, child: Card(child: child)),
    );
  }
}
