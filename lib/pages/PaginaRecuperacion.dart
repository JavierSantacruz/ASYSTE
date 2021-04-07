import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PaginaRecuperacion extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuepacion de contraseña'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.input ),
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
        ],
        automaticallyImplyLeading: false,
       
      ),
      
       body:GestureDetector(
        onTap: (){
          final FocusScopeNode focus = FocusScope.of(context);
          if(!focus.hasPrimaryFocus && focus.hasFocus){
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
      child:ListView(
        children: [
       Container(
        color: Color.fromRGBO(255, 87, 34, 1),
        padding:
            EdgeInsets.only(left: 15.0, top: 50.0, right: 15.0, bottom: 155.0),
        child: Container(
          color: Colors.white,
          child: Card(
            elevation: 20.0,
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(
                  left: 12.0, top: 12.0, right: 12.0, bottom: 12.0),
                  //child: ListView(
              child:Form(
                key: _keyForm,
             child: Column(
                children: <Widget>[
                   Icon(
                Icons.account_circle,
                color: Colors.deepOrangeAccent,
                size: 115.0,
              ),
                  InputText(
                    label: 'Correo Electronico', 
                    icon: Icons.email_outlined,
                    validator: (String text){
                      if(text.contains('@')){
                        return null;
                      }
                      return 'Email no válido';
                    },
                  ),
                  
                  InputText(
                    label: 'Contraseña', 
                    icon: Icons.lock_open_rounded,
                    validator: (String text){
                      if(text.trim().length >5){
                        return null;
                      }
                      return 'Digita contraseña';
                    },
                  ),
                  InputText(
                    label: 'Repetir contraseña', 
                    icon: Icons.lock_open_rounded,
                    validator: (String text){
                      if(text.trim().length > 5){
                        return null;
                      }
                      return 'Digita contraseña';
                    },
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  MaterialButton(
                    child: Text('Recuperar'),
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      _submit(context);
                      //myAlert(context);
                    },
                  ),
                ],
              ),
              ),
            ),
          ),
        ),
     ),
        ]
    ),
    ),
    );
  }
  
  

  void myAlert(BuildContext context,String titulo,String contenido) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(titulo),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(contenido)
                ],
              ),
            ),
            actions:[   
                MaterialButton(
                  child: Text('Ok'),
                  textColor: Colors.deepOrangeAccent,
                  onPressed: () {
                   Navigator.pop(context);
                  },
                )
              ],
            );
          }
        );
  }
  
  void _submit(BuildContext context){
   final ok = _keyForm.currentState.validate();
    if(ok){
      myAlert(context,'Bien hecho','La recuperacion fue exitosa');
    }else{
      myAlert(context,'Aviso','Campos incompletos');
    }
  }
}



class InputText extends StatefulWidget {
  final String label;
  final IconData icon;
  final Function(String) validator;
  const InputText({Key key, @required this.label, @required this.icon,@required this.validator})
      : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: TextStyle(
        color: Colors.deepOrangeAccent,
      ),
      decoration: InputDecoration(
          suffixIcon: Icon(widget.icon),
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
    
  }
}
