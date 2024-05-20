import 'package:flutter/material.dart';
import 'package:preppify/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0), // Added extra space at the top
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White color for contrast
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Please login to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70, // Slightly lighter text
                    ),
                  ),
                  SizedBox(height: 40.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // White text input
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      hintStyle: TextStyle(color: Colors.white70),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Username cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white), // White text input
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Password cannot be empty";
                      } else if (value != null && value.length < 6) {
                        return "Password length should be at least 6";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 40.0),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 100 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0), // Extra space at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
