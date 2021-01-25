import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(0xFF, 0x00, 0x55, 0xaa),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.exit_to_app),
          backgroundColor: Color.fromARGB(0xFF, 0x00, 0x55, 0xaa),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
        body: Container(
          child: Center(
            child: Text("Bienvenido a Masseq App."),
          ),
        ));
  }
}
