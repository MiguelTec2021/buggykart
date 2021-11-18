import 'dart:async';
import 'dart:convert';

import 'package:buggykart/src/pages/dialogs/espera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';




  void ingresar(context, useri, passi)async{
    try {
      espera(context ,true);
      var url = Uri.parse('${serve}server.php');
      var response = await http.post(url, body: {
        'usuario' : useri,
        'password' :passi,
        }
      ).timeout( const Duration(seconds: 60));

      // ignore: unused_local_variable
      var data = jsonDecode(response.body);

      if (response.body !='0') {
        espera(context,false);
      }
      // ignore: unused_local_variable
      int index =0;
      if (response.body!='0') {
        Navigator.pushNamed(context, '/home',);
      }else{
        espera(context, false);
        showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text('HIGHWAY'),
            content: Text('No existe usuario registrado'),
          );
        });
      }
    // ignore: unused_catch_clause
    } on TimeoutException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text('HIGHWAY'),
            content: Text('Tardo la conexión, revise su conexión a internet'),
          );
        });
    // ignore: unused_catch_clause
    }on Error catch (e){
      showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text('HIGHWAY'),
            content: Text('Tardo la conexión, revise su conexión a internet'),
          );
        });
    }
  }