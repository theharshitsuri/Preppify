import "package:flutter/material.dart";
import "package:preppify/utils/routes.dart";

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
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Material(
          color: Colors.white,
          // ignore: prefer_const_constructors
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // ignore: sort_child_properties_last
                children: [
                  //Image.asset("assets/images/login_image.png",
                  //fit: BoxFit.cover, alignment: Alignment.center),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20.0),
                  // ignore: prefer_const_constructors
                  Text("Welcome $name",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
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
                        TextFormField(
                            obscureText: true,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Password cannot be empty";
                              } else if (value != null && value.length < 6) {
                                return "Password length should be atleast 6";
                              } else {
                                return null;
                              }
                            }),
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        // ignore: prefer_const_constructors
                        duration: Duration(seconds: 1),
                        width: changeButton ? 100 : 150,
                        height: 40,
                        alignment: Alignment.center,
                        // ignore: prefer_const_constructors, sort_child_properties_last
                        child: changeButton
                            ? Icon(Icons.done)
                            // ignore: prefer_const_constructors
                            : Text(
                                "Login",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
