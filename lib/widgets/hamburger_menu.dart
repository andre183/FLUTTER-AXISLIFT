import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  final Function(String) onItemSelected;

  HamburgerMenu({@required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'AxisLift Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => onItemSelected('home'),
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Book a Ride'),
            onTap: () => onItemSelected('book_ride'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Ride History'),
            onTap: () => onItemSelected('ride_history'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => onItemSelected('profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => onItemSelected('settings'),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            onTap: () => onItemSelected('help'),
          ),
        ],
      ),
    );
  }
}