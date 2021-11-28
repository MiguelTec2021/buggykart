import 'package:flutter/material.dart';

void espera(context, load) {
  load == true
      ? showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('HIGHWAY'),
              content: Text('Espera......'),
            );
          })
      : Navigator.of(context).pop();
}
