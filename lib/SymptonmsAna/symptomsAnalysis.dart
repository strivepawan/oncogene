import 'package:flutter/material.dart';

class SymptomsAnalysis extends StatefulWidget {
  final String category;

  SymptomsAnalysis(this.category);

  @override
  State<SymptomsAnalysis> createState() => _SymptomsAnalysisState();
}

class _SymptomsAnalysisState extends State<SymptomsAnalysis> {
  TextEditingController symptomController1 = TextEditingController();
  TextEditingController symptomController2 = TextEditingController();
  TextEditingController symptomController3 = TextEditingController();
  TextEditingController symptomController4 = TextEditingController();
  TextEditingController symptomController5 = TextEditingController();
  TextEditingController symptomController6 = TextEditingController();
  TextEditingController symptomController7 = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7370FF),
          title: Text('Symptoms Analysis'),
          
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTextField("Loss Of Appetite", symptomController1),
                SizedBox(height: 12.0),
                buildTextField("Weight Loss", symptomController2),
                SizedBox(height: 12.0),
                buildTextField("Pain in the Area", symptomController3),
                SizedBox(height: 12.0),
                buildTextField("Smoking and alochol use", symptomController4),
                SizedBox(height: 12.0),
                buildTextField("Past Cancer History of family", symptomController5),
                SizedBox(height: 12.0),
                buildTextField("Change in bowel or blader habits", symptomController6),
                SizedBox(height: 12.0),
                buildTextField("Enter your Age", symptomController7),
                SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {
                  
                    if (validateInputs()) {
                      setState(() {
                        isLoading = true;
                      });
                      // Simulate analysis process
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isLoading = false;
                        });
                        showAnalysisDialog(context);
                      });
                    } else {
                      showPopup(context, 'Please fill in all the Details ');
                    }
                  },
                  child: Text('Submit',
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: isLoading
            ? Align(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(),
              )
            : null,
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Type your symptoms here',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  bool validateInputs() {
    return symptomController1.text.isNotEmpty &&
        symptomController2.text.isNotEmpty &&
        symptomController3.text.isNotEmpty &&
        symptomController4.text.isNotEmpty;
  }

  void showAnalysisDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Analysis Result'),
          content: Text('Your data has been analyzed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

