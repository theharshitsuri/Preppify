import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // Import the http package for making HTTP requests
import 'dart:convert'; // Import the dart:convert library for JSON encoding and decoding

// Define the ChatbotPage widget as a stateful widget
class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

// Define the state for the ChatbotPage widget
class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller =
      TextEditingController(); // Controller for text input
  final List<Map<String, String>> _messages =
      []; // List to hold chat messages with role
  bool _isLoading = false; // Loading state to show progress indicator

  // Function to send message to ChatGPT API
  Future<void> _sendMessage() async {
    // Check if input text is empty
    if (_controller.text.isEmpty) return;

    // Update state with user's message and set loading to true
    setState(() {
      _messages.add({"role": "user", "content": _controller.text});
      _isLoading = true;
    });

    // Prepare the conversation history for the API call
    List<Map<String, String>> conversation = [
      {
        'role': 'system',
        'content':
            'You are an interview assistant. Please generate interview questions based on the job description provided. Ask one question at a time. Wait for the user to respond and then mention the strengths and weaknesses of the answer. After every answer, mention the strengths and weaknesses of the response and then ask the user if they want to do another question. If they agree, ask the next question.'
      },
      ..._messages,
    ];

    // Make a POST request to ChatGPT API
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'), // API endpoint
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer API KEY', // API key
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo',
        'messages': conversation,
      }),
    );

    // Check if the response is successful
    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Decode the JSON response
      // Update state with bot's message and set loading to false
      setState(() {
        _messages.add({
          "role": "bot",
          "content": data['choices'][0]['message']['content']
        });
        _isLoading = false;
      });
    } else {
      // If response is not successful, show an error message
      setState(() {
        _messages.add({"role": "bot", "content": "Failed to fetch response."});
        _isLoading = false;
      });
    }

    // Clear the text input field
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.black, // Matching dark color for app bar
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
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the back button here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Align(
                      alignment: _messages[index]['role'] == 'user'
                          ? Alignment
                              .centerRight // Align user's messages to the right
                          : Alignment
                              .centerLeft, // Align bot's messages to the left
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: _messages[index]['role'] == 'user'
                              ? Colors.blueAccent // User's message color
                              : Color(0xFF1E1E1E), // Bot's message color
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          _messages[index]['content']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0, // Font size
                            letterSpacing:
                                1.2, // Add letter spacing for better readability
                            fontFamily: 'Montserrat', // Specify a font family
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    CircularProgressIndicator(), // Show loading indicator while waiting for response
              ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _controller, // Controller for the text field
                      decoration: InputDecoration(
                        hintText: 'Paste job description here...',
                        filled: true,
                        fillColor: Color(
                            0xFF2C2C2C), // Background color of the text field
                        hintStyle:
                            TextStyle(color: Colors.white70), // Hint text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0), // Padding inside the text field
                      ),
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send,
                      color: Colors.white), // Send button icon and color
                  onPressed: _sendMessage, // Send message on button press
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
