import 'dart:async';
import 'dart:convert';

import 'package:buggykart/src/pages/dialogs/espera.dart';
import 'package:buggykart/src/pages/home_page.dart';
import 'package:buggykart/src/pages/home_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';

int index = 0;
int idUsuario = 0;
int idrol = 0 ;
// String nombre = "";
// String edad = "";
// String correo = "";
// String usuario = "";

  void ingresar(context, useri, passi)async{
    try {
      espera(context ,true);
      var url = Uri.parse('${serve2}server.php');
      var response = await http.post(url, body: {
        'page' : 'login',
        'usuario' : useri,
        'password' :passi,
        }
      ).timeout( const Duration(seconds: 60));


      var data = jsonDecode(response.body);
      
        if (response.body!='0') {
          idUsuario = data[0]['id_usuario'];
          idrol = data[0]['id_rol'];
        }
      // // ignore: avoid_print
      print("Cual es el rol:  "+ idrol.toString());

      if (response.body !='0') {
        espera(context,false);
      }

      if (response.body!='0') {
        if (idrol == 2) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeUser(idUsuario, idrol)));
        }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage(idUsuario, idrol)));
        }
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
            content: Text('Error con la base de datos'),
          );
        });
    // ignore: unused_catch_clause
    }on Error catch (e){
      // ignore: avoid_print
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text('HIGHWAY'),
            content: Text('Tardo la conexión, revise su conexión a internet2'),
          );
        });
    }
  }