import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double elevation;
  final double hoverElevation;

  HoverCard({
    @required this.child,
    this.elevation = 1.0,
    this.hoverElevation = 4.0,
  });

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: _isHovering ? widget.hoverElevation : widget.elevation,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}