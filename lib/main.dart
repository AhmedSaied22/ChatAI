import 'package:chat_ai/firebase_options.dart';
import 'package:chat_ai/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        scaffoldBackgroundColor: const Color(0xff0d0d0f),
        primaryColor: const Color(0xff202021),
      ),
      home: const HomeView(),
    );
  }
}
