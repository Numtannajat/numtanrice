import 'package:flutter/material.dart';

class Myservice extends StatefulWidget {
// การโยนค่าระหว่าง state
  final String name;
  Myservice({Key key, this.name}) : super(key: key);

  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
// Field
String nameLogin;


// Method
@override
void initState(){
  super.initState();
  nameLogin = widget.name;
}


  Widget showNameLogin() {
    return Column(
      children: <Widget>[
        Text('Login by'),
        Text(nameLogin),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(actions: <Widget>[showNameLogin()],
        title: Text('My Service'),
        backgroundColor: Colors.green.shade300,
      ),
    );
  }
}
