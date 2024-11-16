import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:axislift_shuttle/screens/home_screen.dart';
import 'package:axislift_shuttle/screens/passenger_request_screen.dart';
import 'package:axislift_shuttle/screens/driver_control_screen.dart';
import 'package:axislift_shuttle/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AxisLift Shuttle Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/passenger_request': (context) => PassengerRequestScreen(),
        '/driver_control': (context) => DriverControlScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AxisLift Shuttle Service'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to AxisLift',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Book Ride Now'),
              onPressed: () => Navigator.pushNamed(context, '/passenger_request'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Sign In with Google'),
              onPressed: () async {
                try {
                  final user = await _authService.signInWithGoogle();
                  if (user != null) {
                    // Show role selection dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select Your Role'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
                                child: Text('Passenger'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(context, '/passenger_request');
                                },
                              ),
                              ElevatedButton(
                                child: Text('Driver'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(context, '/driver_control');
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                } catch (e) {
                  print('Error signing in: $e');
                  // Show error message to user
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}