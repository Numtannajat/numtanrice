import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method

  Widget nameForm() {
    Color color = Colors.green[800];
    String title = 'Name :';
    String help = 'Type Your Name In Blank';
    return TextField(
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperStyle: TextStyle(color: color),
        helperText: help,
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

   Widget userForm() {
    Color color = Colors.red[300];
    String title = 'Username :';
    String help = 'Type Your Username In Blank';
    return TextField(
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperStyle: TextStyle(color: color),
        helperText: help,
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

   Widget passwordForm() {
    Color color = Colors.orange[400];
    String title = 'Password :';
    String help = 'Type Your Password In Blank';
    return TextField(
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperStyle: TextStyle(color: color),
        helperText: help,
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget showAvatar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Image.asset('images/avartar.png'),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(
        Icons.cloud_upload,
        size: 30,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: <Widget>[
          showAvatar(),
          nameForm(),
          userForm(),
          passwordForm(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[
          registerButton(),
        ],
        title: Text(
          'Register',
          style: GoogleFonts.anton(
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.green.shade400,
      ),
    );
  }
}
