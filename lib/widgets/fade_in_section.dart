import 'package:flutter/material.dart';

class FadeInSection extends StatefulWidget {
  final Widget child;
  final double offset;

  FadeInSection({@required this.child, this.offset = 100});

  @override
  _FadeInSectionState createState() => _FadeInSectionState();
}

class _FadeInSectionState extends State<FadeInSection> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _isVisible ? 1.0 : 0.0,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: _isVisible ? 0 : widget.offset),
        child: widget.child,
      ),
    );
  }
}