import 'package:flutter/material.dart';

class RideRequestForm extends StatefulWidget {
  final Function(String, String) onSubmit;

  RideRequestForm({@required this.onSubmit});

  @override
  _RideRequestFormState createState() => _RideRequestFormState();
}

class _RideRequestFormState extends State<RideRequestForm> {
  final _formKey = GlobalKey<FormState>();
  String _pickup;
  String _destination;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Pickup Location'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a pickup location';
              }
              return null;
            },
            onSaved: (value) => _pickup = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Destination'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a destination';
              }
              return null;
            },
            onSaved: (value) => _destination = value,
          ),
          ElevatedButton(
            child: Text('Request Ride'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                widget.onSubmit(_pickup, _destination);
              }
            },
          ),
        ],
      ),
    );
  }
}