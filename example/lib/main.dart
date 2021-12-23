import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MegaApp(
      title: 'Mega Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedType = "1";
  bool _checkBox1 = false;
  bool _checkBox2 = false;
  bool? _checkBox3;

  @override
  Widget build(BuildContext context) {
    return MegaScaffold(
      headerBarTrailing: Row(
        children: [
          MegaIconButton(icon: Icons.info_outlined, onPressed: () {}),
        ],
      ),
      items: [
        NavigationItem(
          title: "Buttons",
          icon: Icons.play_circle_outlined,
          builder: (_) => MegaList(
            title: "Buttons",
            children: [
              Row(
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
            ],
          ),
        ),
        NavigationItem(
          title: "Inputs",
          icon: Icons.check_box_outlined,
          builder: (_) => MegaList(
            title: "Title 1",
            children: [
              MegaListTile(
                leading: MegaRadio(
                  value: "1",
                  groupValue: _selectedType,
                  onChanged: (value) =>
                      setState(() => _selectedType = value as String),
                ),
                title: "Title 1",
                subtitle: "Subtitle 1",
                trailing: MegaCheckBox(
                  value: _checkBox1,
                  onChanged: (value) => setState(() => _checkBox1 = value!),
                ),
              ),
              MegaListTile(
                leading: MegaRadio(
                  value: "2",
                  groupValue: _selectedType,
                  onChanged: (value) =>
                      setState(() => _selectedType = value as String),
                ),
                title: "Title 2",
                subtitle: "Subtitle 2",
                trailing: MegaCheckBox(
                  value: _checkBox2,
                  onChanged: (value) => setState(() => _checkBox2 = value!),
                ),
              ),
              MegaListTile(
                leading: MegaRadio(
                  value: "3",
                  groupValue: _selectedType,
                  onChanged: (value) =>
                      setState(() => _selectedType = value as String),
                ),
                title: "Title 3",
                subtitle: "Subtitle 3",
                trailing: MegaCheckBox(
                  value: _checkBox3,
                  tristate: true,
                  onChanged: (value) => setState(() => _checkBox3 = value),
                ),
              ),
            ],
          ),
        ),
      ],
      body: Center(
        child: Column(
          children: [
            MegaList(
              title: "Title",
              children: [
                MegaListTile(
                  leading: MegaRadio(
                    value: "1",
                    groupValue: _selectedType,
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                  title: "Title 1",
                  subtitle: "Subtitle 1",
                  trailing: const MegaIconButton(
                    icon: Icons.add_outlined,
                    onPressed: null,
                  ),
                ),
                MegaListTile(
                  leading: MegaRadio(
                    value: "2",
                    groupValue: _selectedType,
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                  title: "Title 2",
                  subtitle: "Subtitle 2",
                  trailing: const MegaIconButton(
                    icon: Icons.add_outlined,
                    onPressed: null,
                  ),
                ),
                MegaListTile(
                  leading: MegaRadio(
                    value: "3",
                    groupValue: _selectedType,
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                  title: "Title 3",
                  subtitle: "Subtitle 3",
                  trailing: const MegaIconButton(
                    icon: Icons.add_outlined,
                    onPressed: null,
                  ),
                ),
                MegaListTile(
                  leading: MegaRadio(
                    value: "4",
                    groupValue: _selectedType,
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                  title: "Title 4",
                  subtitle: "Subtitle 4",
                  trailing: const MegaIconButton(
                    icon: Icons.add_outlined,
                    onPressed: null,
                  ),
                ),
                MegaListTile(
                  leading: MegaRadio(
                    value: "5",
                    groupValue: _selectedType,
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                  title: "Title 5",
                  subtitle: "Subtitle 5",
                  trailing: const MegaIconButton(
                    icon: Icons.add_outlined,
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
