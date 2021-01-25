import 'package:flutter/material.dart';
import 'package:masseq_app/pages/home.dart';
// import 'package:flutter_string_encryption/flutter_string_encryption.dart';

void main() => runApp(MiApp());
String userName;
String password;
bool _isHidden = true;

// Este es el estilo de la App
class MiApp extends StatelessWidget {
  const MiApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Mi App", home: Inicio());
  }
}

// Contenido de la App
class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("Masseq Test")),
      body: ListView(
        children: [
          header(context),
          loginFields(context, _togglePasswordView, _isHidden),
          footer(context)
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

Widget header(BuildContext context) {
  return Column(children: [
    Container(
        padding: EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/images/logo.png',
          height: 150,
          width: MediaQuery.of(context).size.width,
          // fit: BoxFit.cover,
        )),
    Text(
      "Login",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    ),
  ]);
}

Widget loginFields(
    BuildContext context, var _togglePasswordView, bool _isHidden) {
  return Column(children: [
    Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: (String value) => {onChange(value)},
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: TextField(
        obscureText: _isHidden,
        onChanged: (String value) => {onChangePassword(value)},
        decoration: InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(Icons.visibility),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    ),
    SizedBox(
      height: 60.0,
    ),
    Container(
        child: Center(
      child: FlatButton(
        color: Color.fromARGB(0xFF, 0x00, 0x55, 0xaa),
        child: Text(
          "Ingresar",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        onPressed: () => {validLogin(context)},
      ),
    )),
  ]);
}

Widget footer(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 30.0,
      ),
      Image.asset(
        'assets/images/splash.png',
        height: 115,
        width: MediaQuery.of(context).size.width,
        // fit: BoxFit.cover,
      ),
      SizedBox(
        height: 7.0,
      ),
      Text(
        "Desarrollado por Massaq",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(0xFF, 0x00, 0x6c, 0x9a),
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      )
    ],
  );
}

var infoUser = {"userName": "test_user", "password": "123456"};

void onChange(String value) => userName = value;

void onChangePassword(String value) => password = value;

validLogin(context) {
  if (userName == infoUser["userName"] && password == infoUser["password"]) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  } else {
    showAlert(
        context, "Error de validación", "Usuario o contraseña incorrectos.");
    print(
        "Usuario y contrasela incorrectos Usuario=> $userName y contraseña $password");
  }
}

void showAlert(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      child: AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ));
}
