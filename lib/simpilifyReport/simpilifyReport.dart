import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SimplifyReports extends StatefulWidget {
  final String category;

  SimplifyReports(this.category);

  @override
  _SimplifyReportsState createState() => _SimplifyReportsState();
}

class _SimplifyReportsState extends State<SimplifyReports> {
  TextEditingController _reportsController = TextEditingController();
  bool _isReportsUploaded = false;
  XFile? _imageFile;
  bool _isAnalyzing = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = XFile(pickedFile.path);
        _isReportsUploaded = true; // Set the flag when a file is uploaded
      });
    }
  }

  Future<void> _analyzeReports() async {
    // Simulate report analysis
    setState(() {
      _isAnalyzing = true;
    });

    // Simulate asynchronous report analysis
    await Future.delayed(Duration(seconds: 2));

    // After analysis, you can perform any required actions
    setState(() {
      _isAnalyzing = false;
    });

    print('Medical reports analyzed: ${_reportsController.text}');
  }

  Future<void> _showAnalysisDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Color(0xFF7370FF),
              ),
              SizedBox(height: 16),
              Text('Analyzing your reports...'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7370FF),
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _pickImage,
                  child: _imageFile != null
                      ? Image.file(
                          File(_imageFile!.path),
                          height: screenWidth * 0.3,
                          width: screenWidth * 0.3,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/upload.png',
                          height: screenWidth * 0.55,
                          width: screenWidth * 0.8,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),

            SizedBox(height: screenWidth * 0.02),
            Text(
              'Upload your medical reports:',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Image preview
            if (_imageFile != null)
              Image.file(
                File(_imageFile!.path),
                height: screenWidth * 1.0,
                width: screenWidth * 0.8,
                fit: BoxFit.cover,
              ),

            SizedBox(height: screenWidth * 0.04),

            // Submit button
            ElevatedButton(
              onPressed: _isReportsUploaded
                  ? () async {
                      // Implement the functionality to process the reports
                      // For simplicity, let's just simulate report analysis
                      await _showAnalysisDialog();
                      await _analyzeReports();
                      Navigator.pop(context); // Close the dialog
                    }
                  : null, // Disable the button if no file is uploaded
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7370FF),
              ),
              child: Text(
                'Report Analysis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // SizedBox(height: screenWidth * 0.04),

            // // Convert button
            // if (_isReportsUploaded)
            //   ElevatedButton(
            //     onPressed: () {
            //       // Implement the functionality to convert reports into simple language
            //       // For example, call a function to process the reports
            //       // and show the simplified result
            //       print('Reports converted into simple language');
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.green,
            //     ),
            //     child: Text('Convert to Simple Language'),
            //   ),
          ],
        ),
      ),
    );
  }
}
