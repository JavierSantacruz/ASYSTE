import 'package:flutter/material.dart';
import 'package:proyecto_movil/pages/PaginaRecuperacion.dart';
import 'package:proyecto_movil/pages/PaginaRegistro.dart';
import 'package:proyecto_movil/pages/bloc/provider.dart';
import 'package:proyecto_movil/pages/home_page.dart';
import 'package:proyecto_movil/pages/login_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp( 
          //debugShowCheckedModeBanner: false,
          title: 'ASYSTE',
          initialRoute: 'login',
          routes: {
            'login': (BuildContext context) => LoginPage(),
            'home': (BuildContext context) => HomePage(),
          	'registro': (BuildContext context) => PaginaRegistro(),  
            'recuperacion': (BuildContext context) => PaginaRecuperacion(),
            'informacion': (BuildContext context) => MiInformacion(),
            
          },
          theme: ThemeData(primaryColor: Colors.deepOrange)),
    );
  }
}

class MiInformacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Informacion'),
        automaticallyImplyLeading: false,
      ),
      
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),*/
    );
  }
}

