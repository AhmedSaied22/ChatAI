import 'package:chat_ai/firebase_options.dart';
import 'package:chat_ai/views/chat_view.dart';
import 'package:chat_ai/views/login_view.dart';
import 'package:chat_ai/views/register_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff0d0d0f),
        primaryColor: const Color(0xff202021),
      ),
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        ChatView.id: (context) => ChatView(),
      },
      initialRoute: LoginView.id,
    );
  }
}
