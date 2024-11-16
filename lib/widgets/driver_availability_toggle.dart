import 'package:flutter/material.dart';

class DriverAvailabilityToggle extends StatefulWidget {
  @override
  _DriverAvailabilityToggleState createState() => _DriverAvailabilityToggleState();
}

class _DriverAvailabilityToggleState extends State<DriverAvailabilityToggle> {
  bool _isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Driver Availability',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Switch(
          value: _isAvailable,
          onChanged: (value) {
            setState(() {
              _isAvailable = value;
            });
            // TODO: Update driver availability status in the backend
          },
        ),
        Text(_isAvailable ? 'Available' : 'Unavailable'),
      ],
    );
  }
}