import 'package:flutter/material.dart';
import 'package:oncogene/BottomNavigation/updates.dart';
import 'package:oncogene/DailyTask/dailyTask.dart';
import 'package:oncogene/HomeScreen/homePage.dart';
import 'package:oncogene/simpilifyReport/simpilifyReport.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SimplifyReports('Reports'),
    DailyTask(),
    Updates(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Daily Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
        ],
        selectedItemColor:  Color(0xFF7370FF), // Change the selected icon color
        unselectedItemColor: Colors.black, // Change the unselected icon color
        selectedLabelStyle: TextStyle(
          color:  Color(0xFF7370FF), // Change the selected label color
          fontWeight: FontWeight.bold, // Make the selected label bold
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black, // Change the unselected label color
          fontWeight: FontWeight.normal, // Make the unselected label normal
        ),
      ),
    );
  }
}
