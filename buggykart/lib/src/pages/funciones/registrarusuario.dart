import 'dart:async';
import 'dart:convert';
// import 'package:buggykart/src/pages/dialogs/espera.dart';
import 'package:buggykart/src/pages/dialogs/terminosycondiciones.dart';
import 'package:buggykart/src/pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


void registrarUsuario(context, nombre, apellidos, edad, usuario, email, contra)async{
  
  try {

    var url = Uri.parse('${serve}validaruser.php');
    var response =  await http.post(url,body: {
      'email' : email,
    }).timeout(const Duration(seconds: 60));

    // ignore: unused_local_variable
    var data = jsonDecode(response.body);

    if (response.body != '1') {
      // registrar(nombre, apellidos, edad, usuario, email, contra);
      terandcon(context,nombre, apellidos, edad, usuario, email, contra);
      // ignore: avoid_print
      print('si');
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text('HIGHWAY'),
            content: Text('El correo ya existe'),
          );
        });
    }

    
  }on TimeoutException {
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

void registrar(context, nombre, apellidos, edad, usuario, email, contra)async{

  try {
    
  
    var url = Uri.parse('${serve}userregister.php');
    var response =  await http.post(url,body: {
      'nombre' : nombre,
      'apellidos' : apellidos,
      'edad' : edad,
      'usuario' : usuario,
      'email' : email,
      'contra' : contra
    }).timeout(const Duration(seconds: 60));

    // ignore: unused_local_variable
    var data = jsonDecode(response.body);

    if (response.body == '1') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } 
  }on TimeoutException catch (e) {
    // ignore: avoid_print
    print(e);
  }
}