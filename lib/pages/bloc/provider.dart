import 'package:flutter/material.dart';
import 'package:proyecto_movil/pages/bloc/login_bloc.dart';
export 'package:proyecto_movil/pages/bloc/login_bloc.dart';

// Vas a ser mi in personalizado
// Puede llamarse de diferente forma,
// puede manejar varios bloc
class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  // en la mayoria de los casos vamos a que querer que haga notificación
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
