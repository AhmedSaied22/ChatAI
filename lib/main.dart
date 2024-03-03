import 'package:chat_ai/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatAiApp());
}

class ChatAiApp extends StatelessWidget {
  const ChatAiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff0d0d0f),
        primaryColor: Colors.deepOrange,
      ),
      home: HomeView(),
    );
  }
}
