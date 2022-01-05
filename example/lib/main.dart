import 'package:flutter/material.dart' show Icons;
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
  bool? _checkBox2 = false;
  bool _switch1 = false;
  var showSearch = false;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MegaScaffold(
      headerBarLeading: MegaIconButton(
        icon: Icons.search_outlined,
        selected: showSearch,
        onPressed: () => setState(() {
          showSearch = !showSearch;
          controller.text = "";
          if (showSearch) {
            FocusScope.of(context).requestFocus(focusNode);
          } else {
            FocusScope.of(context).unfocus();
          }
        }),
      ),
      headerBarTrailing: Row(
        children: [
          MegaIconButton(icon: Icons.info_outlined, onPressed: () {}),
        ],
      ),
      searchField: MegaSearchField(
        showSearch: showSearch,
        controller: controller,
        autofocus: showSearch,
        focusNode: focusNode,
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
          builder: (_) => Column(
            children: [
              MegaList(
                title: "CheckBox",
                children: [
                  MegaCheckBoxListTile(
                    value: _checkBox1,
                    title: "CheckBox 1",
                    subtitle: "Subtitle 1",
                    onChanged: (value) => setState(() => _checkBox1 = value!),
                  ),
                  MegaCheckBoxListTile(
                    value: _checkBox2,
                    title: "CheckBox 2",
                    subtitle: "Subtitle 2",
                    tristate: true,
                    onChanged: (value) => setState(() => _checkBox2 = value),
                  ),
                ],
              ),
              MegaList(
                title: "Radio",
                children: [
                  MegaRadioListTile(
                    value: "1",
                    groupValue: _selectedType,
                    title: "Radio 1",
                    subtitle: "Subtitle 1",
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                  MegaRadioListTile(
                    value: "2",
                    groupValue: _selectedType,
                    title: "Radio 2",
                    subtitle: "Subtitle 2",
                    onChanged: (value) =>
                        setState(() => _selectedType = value as String),
                  ),
                ],
              ),
              MegaList(
                title: "Switch",
                children: [
                  MegaSwitchListTile(
                    title: "Switch 1",
                    subtitle: "Subtitle 1",
                    value: _switch1,
                    onChanged: (value) => setState(() => _switch1 = value),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
      body: const Center(),
    );
  }
}
