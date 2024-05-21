import "package:flutter/material.dart";

class logoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset("assets/logo.png",
            //fit: BoxFit.cover,
            //alignment: Alignment
            //.center), // Ensure you add the logo image in your assets folder
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
