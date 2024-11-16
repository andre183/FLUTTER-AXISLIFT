import 'package:flutter/material.dart';

class TripManagementTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Passenger')),
          DataColumn(label: Text('Pickup')),
          DataColumn(label: Text('Destination')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Actions')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('John Doe')),
            DataCell(Text('123 Main St')),
            DataCell(Text('456 Elm St')),
            DataCell(Text('Pending')),
            DataCell(Row(
              children: [
                ElevatedButton(
                  child: Text('Accept'),
                  onPressed: () {
                    // TODO: Implement accept logic
                  },
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  child: Text('Reject'),
                  onPressed: () {
                    // TODO: Implement reject logic
                  },
                ),
              ],
            )),
          ]),
          // Add more DataRow widgets for additional trips
        ],
      ),
    );
  }
}