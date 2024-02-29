import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oncogene/DailyTask/dailyTask.dart';
import 'package:oncogene/HomeScreen/recentReports/bloodLab.dart';
import 'package:oncogene/HomeScreen/recentReports/diagnosis.dart';
import 'package:oncogene/HomeScreen/recentReports/symptoms.dart';
import 'package:oncogene/SymptonmsAna/symptomsAnalysis.dart';
import 'package:oncogene/simpilifyReport/simpilifyReport.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7370FF),
        
        title: Icon(
          Icons.image,
          size: MediaQuery.of(context).size.width * 0.16,
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        
              Text(
                'Welcome Shruti Kumari',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        
              // Search bar with rounded corners
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
        
              // Container with a row and three columns
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // First Column
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SymptomsAnalysis('SymptomsAnalysis')),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                        ),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/analysis.png',
                              height: 40,
                              width: 40,
                            ),
                           const SizedBox(height: 8),
                          const  Text(
                              'Symptoms\nAnalysis',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    // Second Column
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SimplifyReports('Simplify Reports')),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                        ),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/simpilify.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(height: 8),
                           const Text(
                              'Simplify\nReports',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    // Third Column
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailyTask()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                        ),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/dailyTask.png',
                              height: 40,
                              width: 40,
                            ),
                           const SizedBox(height: 8),
                           const Text(
                              'Daily\nTask',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
        
              // Recent Reports Section
              Text(
                'Recent Reports',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontWeight: FontWeight.bold,
              
                ),
              ),
        
              const SizedBox(height: 16),
        
              // First Row
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BloodLab()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                  
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/shield.png',
                        height: 30,
                        width: 30,
                      ),
                     const Text(
                        'Blood Lab\nReport Analysis',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const  Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(height: 16),
        
              // Second Row
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorDiagnosis()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/shield.png',
                        height: 30,
                        width: 30,
                      ),
                     const Text(
                        'Doctor Diagnosis\nSummery',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     const Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(height: 16),
        
              // Third Row
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SymptomsAnalysisBY()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                      Image.asset(
                        'assets/images/shield.png',
                        height: 30,
                        width: 30,
                      ),
                      const Text(
                        'Symptoms Analysis\nReports',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String category;

  NewPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text('This is the $category page'),
      ),
    );
  }
}


                 
