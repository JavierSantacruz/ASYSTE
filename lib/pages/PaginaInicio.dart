import 'package:flutter/material.dart';
class PaginaInicio extends StatelessWidget {
  const PaginaInicio ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Inicio', 
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

