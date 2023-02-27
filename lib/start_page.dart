import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamedemo/brain_game_page.dart';
import 'package:gamedemo/game_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "三目並べ",
            style: TextStyle(fontSize: 100, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => GamePage()));
              },
              child: Text("ゲームを始める"),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
            height: 50,
            indent: 10,
            endIndent: 20,
          ),
          Text(
            "色あて脳トレ",
            style: TextStyle(fontSize: 100, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => BrainGame()));
              },
              child: Text("ゲームを始める"),
            ),
          )
        ],
      ),
    ));
  }
}
