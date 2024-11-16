import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  final String passengerName;
  final String pickup;
  final String destination;
  final String status;
  final Function onAccept;
  final Function onReject;

  RideCard({
    @required this.passengerName,
    @required this.pickup,
    @required this.destination,
    @required this.status,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              passengerName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, 'Pickup', pickup),
            SizedBox(height: 4),
            _buildInfoRow(Icons.location_on, 'Destination', destination),
            SizedBox(height: 8),
            _buildStatusChip(status),
            SizedBox(height: 16),
            if (status == 'pending')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: onAccept,
                    child: Text('Accept'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: onReject,
                    child: Text('Reject'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        SizedBox(width: 8),
        Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'pending':
        color = Colors.orange;
        break;
      case 'accepted':
        color = Colors.green;
        break;
      case 'completed':
        color = Colors.blue;
        break;
      default:
        color = Colors.grey;
    }
    return Chip(
      label: Text(status),
      backgroundColor: color,
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}