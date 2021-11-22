import 'package:buggykart/src/pages/funciones/registrarusuario.dart';
import 'package:flutter/material.dart';

void terandcon(context,nombre, fotou, apellidos, edad, usuario, email, contra){
      showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Terminos y Condiciones'),
          content: const Text('Debes de aceptar los terminos y condiones para crear la cuenta'),
          actions: [
            InkWell(
              child: const Text('Aceptar'),
              onTap: (){
                  registrar(context, nombre, fotou, apellidos, edad, usuario, email, contra);
              },
            )
          ],
        );
      });
  }