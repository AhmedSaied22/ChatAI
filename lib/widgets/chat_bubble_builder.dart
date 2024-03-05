import 'package:chat_ai/models/chat_models.dart';
import 'package:chat_ai/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatBubbleBuilder extends StatelessWidget {
  const ChatBubbleBuilder({
    super.key,
    required this.messages,
  });

  final List<ChatModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index].parts.isEmpty) {
          // Handle the case when the parts list is empty
          return Text('No parts in this message');
        } else {
          return messages[index].role == 'user'
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        color: userColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('User:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor)),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, left: 2),
                            child: SelectableText(
                                messages[index].parts.first.text),
                          ),
                        ],
                      )),
                )
              : Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                        ),
                        color: kPrimaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Gemini:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kSecondaryColor)),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, left: 2),
                            child: SelectableText(
                                messages[index].parts.first.text),
                          ),
                        ],
                      )),
                );
        }
      },
    );
  }
}
