import 'package:flutter/material.dart';

class SymptomsAnalysisBY extends StatelessWidget {
  const SymptomsAnalysisBY({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color(0xFF7370FF),
        title: Text("Symptoms Analysis"),
      ),
      body: Stack(
        // fit: StackFit.expand,
        children: [
          // Full screen background image
          Image.asset(
            'assets/images/symptoms.png', // Replace with your actual image path
            fit: BoxFit.cover,
          ),
          // Your content on top of the image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Your other widgets go here
                Text(
                  'Symptoms Analysis',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(height: 20.0),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle button press
                //   },
                //   // child: Text('Submit'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
