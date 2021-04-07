import 'package:flutter/material.dart';
import 'package:proyecto_movil/pages/PaginaCodigo.dart';
import 'package:proyecto_movil/pages/PaginaInicio.dart';
import 'package:proyecto_movil/pages/PaginaAsistencia.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaActual = 1;
//sirve para agregar paginas a la barra de navegacion
  List<Widget> _paginas = [
    PaginaInicio(),
    PaginaCodigo(),
    PaginaAsistencia(),
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
         actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mood),
            onPressed: () {
              Navigator.pushNamed(context, 'informacion');
            },
          ),
        ],
        automaticallyImplyLeading: false,
      
      ),
     
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: [
          //El BottomNavigationBarItem es para los campos o paginas qeu va tener la barra de navegacion
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon:  Icon(Icons.center_focus_weak), label: "Codigo"),
          BottomNavigationBarItem(icon: Icon(Icons.dvr_outlined), label: "Asistencia"),
          
        ],
        ),
    );
  }
}




