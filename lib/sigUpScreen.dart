
import 'package:flutter/material.dart';
import 'package:oncogene/BottomNavigation/bottomNaigation.dart';
import 'package:oncogene/HomeScreen/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Color(0xFF7370FF), // Set the background color here
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shield.png', // Replace with your app logo asset
              height: 40, // Set the height of the image as needed
            ),
           const SizedBox(width: 8), // Adjust spacing between image and text
           const Text(
              'Oncogene Shield',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'assets/images/oncogenelogo.png',
              fit: BoxFit.cover,
            ),
          ),

        const SizedBox(height: 20),

          // Centered and formatted text
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children:const [
                TextSpan(
                  text: '1st Oncology App',
                ),
                TextSpan(
                  text: 'To Predict\n',
                ),
                TextSpan(
                  text: 'and Prevent Early Stages of\n',
                ),
                TextSpan(
                  text: 'Cancer',
                ),
              ],
            ),
          ),

         const SizedBox(height: 40),

          // Sign up button at the bottom
          ElevatedButton(
            onPressed: () {
              // Navigate to a new page when the button is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigation()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7370FF),
            ),
            child:const Text('Sign Up',
            style:TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ) ,
            
            ),
          ),
        ],
      ),
    );
  }
}



