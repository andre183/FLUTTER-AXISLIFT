import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildFAQItem(
                'How do I book a ride?',
                'To book a ride, simply open the app, enter your pickup location and destination, then tap "Request Ride".',
              ),
              _buildFAQItem(
                'How do I become a driver?',
                'To become a driver, go to the "Become a Driver" section in the app and follow the registration process.',
              ),
              _buildFAQItem(
                'What payment methods are accepted?',
                'We accept credit cards, debit cards, and mobile payment methods like Apple Pay and Google Pay.',
              ),
              SizedBox(height: 32),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email Support'),
                subtitle: Text('support@axislift.com'),
                onTap: () {
                  // TODO: Implement email support action
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone Support'),
                subtitle: Text('+1 (555) 123-4567'),
                onTap: () {
                  // TODO: Implement phone support action
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                child: Text('Submit a Support Ticket'),
                onPressed: () {
                  // TODO: Implement support ticket submission
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(answer),
        ),
      ],
    );
  }
}