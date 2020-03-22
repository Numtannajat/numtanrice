import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numtanrice/utility/normal_dialog.dart';
import 'package:numtanrice/widget/my_service.dart';
import 'package:numtanrice/widget/rdgister.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Field

  String user, password;

// Method
  Widget singInButton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text(
        'Sing In',
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(
              context, 'มีช่องว่าง', 'กรอกดิทุกช่องด้วย พูดไม่รู้เรื่องไง');
        } else {
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    try {
      String url =
          'https://www.androidthai.in.th/rice/getUserWhereUserNumtan.php?isAdd=true&User=$user';

      var reponse = await Dio().get(url);
      print('reponse ===> $reponse');

      if (reponse.toString() == 'null') {
        normalDialog(context, 'User False', 'ไม่มี User $user บนฐานข้อมูล');
      } else {
        var result = json.decode(reponse.data);
        print('result ==> $result');

        for (var map in result) {
          String truePassword = map['Password'];
          String nameLogin = map['Name'];

          if (password == truePassword) {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => Myservice(
                name: nameLogin,
              ),
            );
            Navigator.of(context).pushAndRemoveUntil(route, (value) => false);
          } else {
            normalDialog(context, 'Password False', 'กรอก Password ใหม่มันผิด');
          }
        }
      }
    } catch (e) {}
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
        onChanged: (value) => user = value.trim(),
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
        onChanged: (value) => password = value.trim(),
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
