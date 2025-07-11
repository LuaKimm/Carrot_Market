import 'package:carrot_market/models/chat_message.dart';
import 'package:carrot_market/screens/chatting/components/chat_container.dart';
import 'package:carrot_market/screens/components/appbar_preferred_size.dart';
import 'package:flutter/material.dart';

class ChattingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅'),
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: List.generate(
          chatMessageList.length,
            (index) => ChatContainer(chatMessage: chatMessageList[index]),
        ),
      ),
    );
  }
}