import 'package:flutter/material.dart';

class SmoothScrollNavigation extends StatelessWidget {
  final List<String> items;
  final Function(String) onItemSelected;

  SmoothScrollNavigation({
    @required this.items,
    @required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () => onItemSelected(items[index]),
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}