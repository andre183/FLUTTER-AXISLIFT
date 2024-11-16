import 'package:flutter/material.dart';

class RideHistory extends StatelessWidget {
  final List<RideHistoryItem> rideHistory = [
    RideHistoryItem(
      date: '2023-05-15',
      pickup: '123 Main St',
      destination: '456 Elm St',
      fare: 25.50,
    ),
    RideHistoryItem(
      date: '2023-05-14',
      pickup: '789 Oak Ave',
      destination: '321 Pine Rd',
      fare: 18.75,
    ),
    // Add more ride history items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: rideHistory.length,
      itemBuilder: (context, index) {
        final ride = rideHistory[index];
        return Card(
          margin: EdgeInsets.only(bottom: 16),
          child: ListTile(
            title: Text('${ride.pickup} to ${ride.destination}'),
            subtitle: Text(ride.date),
            trailing: Text('R${ride.fare.toStringAsFixed(2)}'),
            onTap: () {
              // TODO: Implement ride details view
            },
          ),
        );
      },
    );
  }
}

class RideHistoryItem {
  final String date;
  final String pickup;
  final String destination;
  final double fare;

  RideHistoryItem({
    @required this.date,
    @required this.pickup,
    @required this.destination,
    @required this.fare,
  });
}