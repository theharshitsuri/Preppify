import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1F1F1F),
        appBar: AppBar(
          backgroundColor: Color(0xFF1F1F1F),
          title: Text(
            "Preppify",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Number of columns in the grid
                      crossAxisSpacing: 8.0, // Spacing between columns
                      mainAxisSpacing: 16.0, // Spacing between rows
                      childAspectRatio: 2.0, // Aspect ratio of each grid item
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      String boxText = index == 0
                          ? "Computer Science and Engineering"
                          : "Coming Soon...";
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF2C2C2C), // Dark grey color
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              offset: Offset(4.0, 4.0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              boxText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
