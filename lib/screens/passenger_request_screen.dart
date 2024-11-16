import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:axislift_shuttle/services/location_service.dart';
import 'package:axislift_shuttle/services/payment_service.dart';
import 'package:axislift_shuttle/widgets/ride_request_form.dart';

class PassengerRequestScreen extends StatefulWidget {
  @override
  _PassengerRequestScreenState createState() => _PassengerRequestScreenState();
}

class _PassengerRequestScreenState extends State<PassengerRequestScreen> {
  GoogleMapController _mapController;
  final LocationService _locationService = LocationService();
  final PaymentService _paymentService = PaymentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request a Ride'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(-26.2041, 28.0473), // Johannesburg coordinates
                zoom: 11.0,
              ),
            ),
          ),
          RideRequestForm(
            onSubmit: (pickup, destination) async {
              try {
                final route = await _locationService.getRoute(pickup, destination);
                final fare = _locationService.calculateFare(route);
                
                // Update map with route
                _mapController.animateCamera(
                  CameraUpdate.newLatLngBounds(route.bounds, 50.0),
                );

                // Show fare confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Ride'),
                      content: Text('Estimated fare: R${fare.toStringAsFixed(2)}'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: Text('Confirm'),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            try {
                              await _paymentService.chargeRetainer(fare * 0.3);
                              // TODO: Send ride request to available drivers
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Ride request sent!')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Payment failed: $e')),
                              );
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}