import 'package:flutter/material.dart';
import 'package:flutter_callbacks/parent_widget.dart';

// Function callback Implementation
typedef MapCallback = void Function(Map<String, dynamic> val);

class ChildWidget extends StatelessWidget {
  // Function callback Implementation
  final MapCallback callback;

  ChildWidget({super.key, required this.callback});

  final List<Map<String, dynamic>> contacts = [
    {
      'name': 'Stanley',
      'number': 111111,
      'address': 'Dubai',
      'image': 'assets/stan.png'
    },
    {
      'name': 'Maryan',
      'number': 22222,
      'address': 'London',
      'image': 'assets/maryan.png'
    },
    {
      'name': 'Kingsley',
      'number': 333333,
      'address': 'New York',
      'image': 'assets/kins.png'
    },
    {
      'name': 'Mary',
      'number': 444444,
      'address': 'Toronto',
      'image': 'assets/mary.png'
    },
    {
      'name': 'Ezekiel',
      'number': 555555,
      'address': 'Texas',
      'image': 'assets/ezeki.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...contacts
              .map((e) => InkWell(
                    onTap: () {
                      // Function callback call
                      callback({
                        'name': e['name'],
                        'number': e['number'],
                        'address': e['address'],
                        'image': e['image'],
                      });

                      // of Pattern call
                      ParentWidget.of(context)?.contact = {
                        'name': e['name'],
                        'number': e['number'],
                        'address': e['address'],
                        'image': e['image'],
                      };
                    },
                    child: CircleAvatar(
                      child: Image.asset(e['image']),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
