import 'package:flutter/material.dart';
import 'package:flutter_ui_kakao/component/chat_icon_button.dart';
import 'package:flutter_ui_kakao/component/my_chat.dart';
import 'package:flutter_ui_kakao/component/other_chat.dart';
import 'package:flutter_ui_kakao/component/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  // 입력한 글을 저장해 둘 리스트
  final List<MyChat> chats = [];
  // 입력한 글을 제어하기 위한 컨트롤러
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFb2c7da),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "홍길동",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: const [
            Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
            SizedBox(width: 25),
            Icon(FontAwesomeIcons.bars, size: 20),
            SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const TimeLine(time: "2021년 1월 1일 금요일"),
                      const OtherChat(
                        name: "홍길동",
                        text: "새해 복 많이 받으세요",
                        time: "오전 10:10",
                      ),
                      const MyChat(
                        text: "선생님도 많이 받으십시오.",
                        time: "오후 2:15",
                      ),
                      // chats 에 새글이 추가되면 화면에 나열하기 위해
                      ...List.generate(chats.length, (index) => chats[index]),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.squarePlus)),
                  Expanded(
                    child: TextField(
                      controller: _textController, // textfield 접근
                      maxLines: 1,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      onSubmitted: _handleSubmitted, // 글 입력 완료시 발생 이벤트
                    ),
                  ),
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.faceSmile)),
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.gear)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 입력하면
  void _handleSubmitted(text) {
    _textController.clear(); // 입력하던 controller 를 비운다.
    setState(() { // chats 에 추가하면서 다시 그리기
      chats.add(
        MyChat(
            text: text,
            time: DateFormat("a K:m") // intl 날씨 포맷 => AM PM replace 까지
                .format(DateTime.now())
                .replaceAll("AM", "오전")
                .replaceAll("PM", "오후")),
      );
    });
  }
}
