import 'package:flutter/material.dart';
import 'package:axislift_shuttle/widgets/trip_management_table.dart';
import 'package:axislift_shuttle/widgets/driver_availability_toggle.dart';
import 'package:axislift_shuttle/widgets/profile_settings.dart';
import 'package:axislift_shuttle/widgets/earnings_tracker.dart';

class DriverControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Driver Control Panel'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Trips'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.attach_money), text: 'Earnings'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TripManagementTable(),
            ProfileSettings(),
            EarningsTracker(),
            DriverAvailabilityToggle(),
          ],
        ),
      ),
    );
  }
}