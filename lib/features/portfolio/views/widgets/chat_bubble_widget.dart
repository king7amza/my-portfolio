import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe; // عشان نحدد الفقاعة على اليمين ولا الشمال

  const ChatBubble({super.key, required this.message, this.isMe = true});

  @override
  Widget build(BuildContext context) {
    // alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    return Container(
      width: 200,
      height: 50,
      margin: EdgeInsets.only(bottom: 0, top: 10, left: 0, right: 20),
      padding: EdgeInsets.all(12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue : Colors.grey[300], // لون الفقاعة
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
          bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isMe ? Colors.white : Colors.black87,
          fontSize: 10,
        ),
      ),
    );
  }
}
