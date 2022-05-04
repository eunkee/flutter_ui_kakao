import 'package:flutter/material.dart';
import 'package:flutter_ui_kakao/component/profile_card.dart';
import 'package:flutter_ui_kakao/models/user.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("친구")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ProfileCard(user: me),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Text("친구"),
                const SizedBox(width: 6),
                Text("${friends.length}"),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: List.generate(
              friends.length,
              (index) => ProfileCard(user: friends[index]),
            ),
          )),
        ],
      ),
    );
  }
}
