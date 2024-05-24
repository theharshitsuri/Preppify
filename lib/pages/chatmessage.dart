import 'package:flutter/material.dart';

// Define a ChatMessage widget to represent a single chat message
class ChatMessage extends StatelessWidget {
  final String text; // Text of the message
  final bool isUser; // Whether the message is from the user or the bot

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10.0), // Margin around the message
      child: Row(
        // Align the message to the end if it's from the user, otherwise start
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(
                10.0), // Padding inside the message container
            decoration: BoxDecoration(
              // Background color based on whether it's a user or bot message
              color: isUser ? Colors.blueAccent : Colors.grey,
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: Text(
              text,
              style: TextStyle(color: Colors.white), // Text color
            ),
          ),
        ],
      ),
    );
  }
}
