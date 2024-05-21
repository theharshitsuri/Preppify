import "package:flutter/material.dart";
import "package:preppify/pages/home_page.dart";
import "package:preppify/pages/login_page.dart";
import "package:preppify/pages/logo_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        // ignore: prefer_const_constructors
        "/": (context) => logoPage(),
        // ignore: prefer_const_constructors
        //MyRoutes.homeRoute: (context) => HomePage(),
        // ignore: prefer_const_constructors
        //MyRoutes.loginRoute: (context) => LoginPage(),
        // ignore: prefer_const_constructors
        //MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
