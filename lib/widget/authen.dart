import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Field

// Method

  Widget showLogo() {
    return Center(
      child: Container(
        width: 200.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLogo(),
    );
  }
}
