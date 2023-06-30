import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to DoctorJi, a psychotherapist consultant app designed to provide you with professional mental health support and guidance. By using our app and its services, you agree to comply with the following terms and conditions:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. User Responsibilities:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1.1. You must be at least 18 years old to use the app or have parental consent.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '1.2. You are solely responsible for the accuracy and truthfulness of the information you provide during registration or while using the app.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '1.3. You understand that the information provided by the therapists on DoctorJi is not a substitute for professional medical advice, diagnosis, or treatment.',
              style: TextStyle(fontSize: 16.0),
            ),
            // Include other terms and conditions as necessary
          ],
        ),
      ),
    );
  }
}
