import 'package:flutter/material.dart';

class PaginaCodigo extends StatelessWidget {
  const PaginaCodigo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     child: Image.asset('assets/QR.png'),
         padding: EdgeInsets.symmetric(vertical: 110, horizontal: 50),
         margin: EdgeInsets.all(20),
         decoration: BoxDecoration(
           color: Color.fromRGBO(225, 112, 67, 1.0),
           border: Border.all(color: Colors.white70, width: 2),
           borderRadius: BorderRadius.circular(20)
         ),
   );
  }
}
