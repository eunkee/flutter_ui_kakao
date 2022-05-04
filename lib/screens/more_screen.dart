import 'package:flutter/material.dart';
import 'package:flutter_ui_kakao/models/tab.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("더보기"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView.count(crossAxisCount: 4, // 한 줄에 4개 출력
        children:
          List.generate(
              tabs.length,
              (index) => Column(
                children: [
                  Icon(tabs[index].icon),
                  const SizedBox(height: 5),
                  Text(tabs[index].text),
                ],
              )
          ),
        ),
      ),
    );
  }
}
