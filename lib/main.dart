import 'package:flutter/material.dart';
import 'package:preppify/pages/chatbot_page.dart';
import 'package:preppify/pages/home_page.dart';
import 'package:preppify/pages/login_page.dart';
import 'package:preppify/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.chatbotRoute: (context) => ChatbotPage(),
      },
    );
  }
}
