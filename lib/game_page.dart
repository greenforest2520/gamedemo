import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<List<String>> field = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];

  List<List<List<int>>> lines = [
    [
      [0, 0],
      [0, 1],
      [0, 2],
    ], // 横向き
    [
      [1, 0],
      [1, 1],
      [1, 2],
    ],
    [
      [2, 0],
      [2, 1],
      [2, 2],
    ],
    [
      [0, 0],
      [1, 0],
      [2, 0],
    ], // 縦向き
    [
      [0, 1],
      [1, 1],
      [2, 1],
    ],
    [
      [0, 2],
      [1, 2],
      [2, 2],
    ],
    [
      [0, 0],
      [1, 1],
      [2, 2],
    ], // 斜め
    [
      [0, 2],
      [1, 1],
      [2, 0],
    ],
  ];

  String currentPlayer = "X";
  bool finished = false;
  String winner = "";

  void updateField(String player, int row, int column) {
    if (finished) return;
    if (field[row][column] != "") return;
    setState(() {
      field[row][column] = player;
      if (currentPlayer == "X") {
        currentPlayer = "O";
      } else {
        currentPlayer = "X";
      }
    });
    checkIfGameFinished();
  }

  void checkIfGameFinished() {
    for (var line in lines) {
      String first = field[line[0][0]][line[0][1]];
      String second = field[line[1][0]][line[1][1]];
      String third = field[line[2][0]][line[2][1]];
      if (first != "" && first == second && second == third) {
        print("$firstの勝ち");
        finished = true;
        winner = first;
        return;
      }
    }

    bool isFilled = true;
    for (int row = 0; row < 3; row++) {
      for (int column = 0; column < 3; column++) {
        if (field[row][column] == "") {
          isFilled = false;
        }
      }
    }
    if (isFilled) {
      print("引き分け");
      finished = true;
      winner = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    String message = "$currentPlayerの手番です";
    if (finished) {
      if (winner == "") {
        message = "引き分け";
      } else {
        message = "$winner の勝ち!";
      }
    }
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            message,
            style: TextStyle(fontSize: 40),
          ),
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.blue.shade300,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: (() {
                        updateField(currentPlayer, 0, 0);
                      }),
                      child: Text(
                        field[0][0],
                        style: const TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: TextButton(
                      onPressed: (() {
                        updateField(currentPlayer, 0, 1);
                      }),
                      child: Text(
                        field[0][1],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: (() {
                        updateField(currentPlayer, 0, 2);
                      }),
                      child: Text(
                        field[0][2],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: TextButton(
                      onPressed: () {
                        updateField(currentPlayer, 1, 0);
                      },
                      child: Text(
                        field[1][0],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: (() {
                        updateField(currentPlayer, 1, 1);
                      }),
                      child: Text(
                        field[1][1],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: TextButton(
                      onPressed: () {
                        updateField(currentPlayer, 1, 2);
                      },
                      child: Text(
                        field[1][2],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: (() {
                        updateField(currentPlayer, 2, 0);
                      }),
                      child: Text(
                        field[2][0],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: TextButton(
                      onPressed: () {
                        updateField(currentPlayer, 2, 1);
                      },
                      child: Text(
                        field[2][1],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: (() {
                        updateField(currentPlayer, 2, 2);
                      }),
                      child: Text(
                        field[2][2],
                        style: TextStyle(fontSize: 50),
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("やめる"),
          ),
        )
      ],
    )));
  }
}
