import 'dart:async';

class Validators {
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Email no es correcto');
      }
    },
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 100) {
        sink.add(password);
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }
    },
  );
}

/*final validarEmail = 
    StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
      if (email, sink) {
        sink.addError(email);
      } else {
        sink.addError('enter a valid email');
      }
    }); 
final validarPassword = 
    StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
      if (password.contains('123')) {  
        sink.add(password);
      } else {
        sink.addError('Invalida contraeña');
      }
    });
  }*/
