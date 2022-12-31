import 'package:flutter/material.dart';
import 'package:flutter_callbacks/child_widget.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => ParentWidgetState();

  // --> NOTE this! <-- Of Implementation.
  static ParentWidgetState? of(BuildContext context) =>
      context.findAncestorStateOfType<ParentWidgetState>();
}

class ParentWidgetState extends State<ParentWidget> {
  Map<String, dynamic> _contact = {};

  // setting the new data sent by of pattern
  set contact(Map<String, dynamic> value) => setState(() => _contact = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Callbacks'),
        ),
        body: Column(
          children: [
            Container(
              height: 300.0,
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.green],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.clamp)),
              child: _contact.isEmpty
                  ? const Center(
                      child: Text(
                      'Select a Contact',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ))
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage: AssetImage(_contact['image']),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _contact['name'],
                              style: const TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              _contact['number'].toString(),
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.white70),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              _contact['address'],
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 40,
            ),
            ChildWidget(callback: (val) => setState(() => _contact = val)),
          ],
        ));
  }
}
