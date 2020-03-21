import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numtanrice/widget/rdgister.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Field

// Method
  Widget singInButton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text(
        'Sing In',
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {},
    );
  }

  Widget singUpButton() {
    return OutlineButton(
      child: Text('Sing Up'),
      onPressed: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Register());
        Navigator.of(context).push(route);
      },
    );
  }

  Widget showButtom() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        singInButton(),
        mySizeBox(),
        singUpButton(),
      ],
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 20.0,
      width: 8.0,
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'User :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Numtan Rice',
      style: GoogleFonts.liuJianMaoCao(
          textStyle: TextStyle(
        color: Colors.green[200],
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      )),
    );
  }

  Widget showLogo() {
    return Container(
      width: 200.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, Colors.green[200]],
            radius: 0.7,
            center: Alignment(0, -0.2),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                mySizeBox(),
                userForm(),
                mySizeBox(),
                passwordForm(),
                mySizeBox(),
                showButtom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
