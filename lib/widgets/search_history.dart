import 'package:flutter/material.dart';

class SearchHistoryWidget extends StatelessWidget {
  SearchHistoryWidget({Key? key}) : super(key: key);

  final List<String> history = [
    "ttttt",
    "jhhhhhhhh",
    "ddddddddd",
    "fgmdg",
    "sdfsdf"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              onTap: (){},
              title: Text(history[index]),
              trailing: const Icon(Icons.history),
            ),
          );
        },
      ),
    );
  }
}
