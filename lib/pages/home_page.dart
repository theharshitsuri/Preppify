import 'package:flutter/material.dart';
import 'package:preppify/pages/chatbot_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Preppify",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 16.0, // Spacing between columns
              mainAxisSpacing: 16.0, // Spacing between rows
              childAspectRatio: 1.5, // Aspect ratio of each grid item
            ),
            children: [
              _buildGridItem(
                  context, "Computer Science and Engineering", ChatbotPage()),
              _buildGridItem(context, "Data Science", ChatbotPage()),
              _buildGridItem(context, "Product Management", ChatbotPage()),
              _buildGridItem(context, "Software Development", ChatbotPage()),
              _buildGridItem(context, "Cyber Security", ChatbotPage()),
              _buildGridItem(context, "UI/UX Design", ChatbotPage()),
              _buildGridItem(context, "Finance", ChatbotPage()),
              _buildGridItem(context, "Marketing", ChatbotPage()),
              _buildGridItem(context, "Human Resources", ChatbotPage()),
              _buildGridItem(context, "Sales", ChatbotPage()),
              _buildGridItem(context, "Mechanical Engineering", ChatbotPage()),
              _buildGridItem(context, "Electrical Engineering", ChatbotPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String streamName, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E), // Slightly lighter dark color
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
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
              streamName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
