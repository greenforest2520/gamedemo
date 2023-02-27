import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'result_page.dart';

class BrainGame extends StatefulWidget {
  const BrainGame({super.key});

  @override
  State<BrainGame> createState() => _BrainGameState();
}

List<String> texts = ["あか", "みどり", "あお"];

List<Color> colors = [Colors.red, Colors.green, Colors.blue];

class _BrainGameState extends State<BrainGame> {
  late Color currentColor;
  late String currentText;
  int problemTimes = 0;
  int maruTimes = 0;

  @override
  void initState() {
    super.initState();
    updateProblem();
  }

  void updateProblem() {
    currentColor = colors[Random().nextInt(3)];
    currentText = texts[Random().nextInt(3)];
  }

  void checkAnswer(Color guess) {
    if (currentColor == guess) {
      print("正解");
      maruTimes++;
      problemTimes++;
      print("正解数:$maruTimes");
    } else {
      print("不正解");
      problemTimes++;
    }

    setState(() {
      updateProblem();

      print("問題数:$problemTimes");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "文字の「色」のボタンを押そう",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                currentText,
                style: TextStyle(color: currentColor, fontSize: 100),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (problemTimes == 5) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                ResultPage(maruTimes, problemTimes)));
                      }
                      checkAnswer(Colors.red);
                    },
                    child: Text("Red"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (problemTimes == 5) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                ResultPage(maruTimes, problemTimes)));
                      }
                      checkAnswer(Colors.green);
                    },
                    child: Text("Green"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (problemTimes == 5) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                ResultPage(maruTimes, problemTimes)));
                      }
                      checkAnswer(Colors.blue);
                    },
                    child: Text("Blue"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
