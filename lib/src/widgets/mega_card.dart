import 'package:flutter/material.dart';

class MegaCard extends StatelessWidget {
  final Widget child;

  const MegaCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(child: child);
}
