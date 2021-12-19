import 'package:flutter/material.dart';
import 'package:mega/mega.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MegaApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MegaScaffold(
      headerBar: MegaHeaderBar(
        leading: Row(
          children: [
            MegaIconButton(icon: Icons.add_outlined, onPressed: () {}),
            MegaTextButton(text: "Open", onPressed: () {}),
            MegaButton(
              text: "Add",
              icon: Icons.add_outlined,
              onPressed: () {},
            ),
            MegaLinkedButtons(
              buttons: [
                MegaLinkedButton(
                  text: "Add",
                  icon: Icons.add_outlined,
                  onPressed: () {},
                ),
                MegaLinkedButton.text(
                  text: "Open",
                  onPressed: () {},
                ),
                MegaLinkedButton.icon(
                  icon: Icons.add_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            MegaList(
              title: "Title",
              children: [
                Text("data"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
