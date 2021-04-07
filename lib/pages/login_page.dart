/*import 'dart:html';*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_movil/pages/bloc/login_bloc.dart';
import 'package:proyecto_movil/pages/bloc/provider.dart';
import 'package:proyecto_movil/pages/home_page.dart';


class LoginPage extends StatelessWidget {
      //Intento de la validacion
  final usuario = TextEditingController();
  final password = TextEditingController();

  String usu = '';
  String pass = ''; 
  ////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Ocultar el teclado
      body:GestureDetector(
        onTap: (){
          final FocusScopeNode focus = FocusScope.of(context);
          if(!focus.hasPrimaryFocus && focus.hasFocus){
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: Stack(
      children: [
        _crearFondo(context),
        _loginForm(context),
      ],
    )
  )
);
}

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(255, 99, 65, 1.0),
        Color.fromRGBO(255, 99, 65, 1.0),
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.00),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              // Truco para centrar toda la columna en base a un hijo
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Iniciar Sesion',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  _loginForm(context) {
    // Busca el objeto Provider en mi arbol de Widgets
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 190.0,
          )),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                _crearEmail(bloc),
                _crearPassword(bloc),
                _crearBoton(bloc, context),
              ],
            ),
          ),
          FlatButton(
            child: Text("Registrar"),
            textColor: Colors.deepOrange,
            onPressed: () {
              Navigator.pushNamed(context,'registro');
            },
          ),
          FlatButton(
            child: Text("¿Olvidaste la contraseña?"),
            textColor: Colors.deepOrange,
            onPressed: () {
              Navigator.pushNamed(context, 'recuperacion');
            },
          ),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
       //campo del usuario/correo
        //inicio
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            //intento de validacion
          controller: usuario,  
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepOrange,
                ),
                hintText: "ejemplo@correo.com",
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error),

            // onChanged: (value) => bloc.chancheEmail(value),
            onChanged: (hola) => bloc.changeEmail(hola),
          ),
        );
        //final
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: password,
            ////////
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepOrange,
                ),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                /*errorText: snapshot.error,*/
                ),
            onChanged:(holaaa) => bloc.changePassword(holaaa),
          ),
          //vamos haber que hacemos 
        );
      },
    );
  }

 Widget _crearBoton(LoginBloc bloc, context) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      // initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('ingresar'),
                ),
              
                onPressed: () {
                   usu = usuario.text;
                   pass = password.text;  
                    
                    if(usu == 'ajtitimbo@misena.edu.co' && pass =='123456'){
                      //este codigo es para navegar a otra pantalla
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context){
                          return new HomePage();
                        }
                      ));
                     //Para que no se vea el teclado al salir   
                     FocusScope.of(context).unfocus(); 

                    } else {

                      showDialog(
                        context: context,
                        //Para obligar apresionar el boton "Aceptar"
                        barrierDismissible: false,
                        ////
                         builder: (BuildContext context){
                           return CupertinoAlertDialog(
                             title: Text('Aviso'),
                             content: SingleChildScrollView(
                               child: ListBody(
                                 children: [
                                   Text('Verifica tus datos')
                                 ],
                               ),
                             ),
                             actions: [
                               FlatButton(
                                 child: Text('Aceptar'),
                                 textColor: Colors.deepOrange,
                                 onPressed: (){
                                   Navigator.of(context).pop();
                                 },
                                )
                             ],
                           );
                         }
                      );
                }
                  // print(usu+' '+pass); //=> para mostrar en la consola
                //para limpiar los espacion  
                   usuario.text = '';
                  password.text = '';
                 ////   
                },
            )
        );
      }
    );
 }
}










               