import 'package:flutter/material.dart';
import 'package:axislift_shuttle/widgets/trip_management_table.dart';
import 'package:axislift_shuttle/widgets/earnings_tracker.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'System Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildOverviewCards(),
              SizedBox(height: 32),
              Text(
                'Recent Trips',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TripManagementTable(),
              SizedBox(height: 32),
              Text(
                'Earnings Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              EarningsTracker(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildOverviewCard('Total Users', '1,234', Icons.people),
        _buildOverviewCard('Active Drivers', '56', Icons.drive_eta),
        _buildOverviewCard('Completed Trips', '789', Icons.check_circle),
      ],
    );
  }

  Widget _buildOverviewCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}