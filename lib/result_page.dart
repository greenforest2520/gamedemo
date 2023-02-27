import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamedemo/start_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.maruTimes, this.problemTimes);

  int maruTimes;

  int problemTimes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("正答率",
              style: TextStyle(fontSize: 100, color: Colors.black54)),
          const SizedBox(
            height: 15,
          ),
          Text("${maruTimes.toString()}/${problemTimes.toString()}",
              style: TextStyle(fontSize: 80, color: Colors.black54)),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => StartPage()),
                    (_) => false);
              },
              child: Text("Topに戻る")),
        ]),
      ),
    );
  }
}
