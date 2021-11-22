import 'dart:async';
import 'dart:convert';

import 'package:buggykart/src/pages/funciones/login.dart';
import 'package:buggykart/src/pages/home_page.dart';
// import 'package:buggykart/src/pages/news_page.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';

class AddNew extends StatefulWidget {
  const AddNew(idUsuario, {Key? key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState(idUsuario);
}

class _AddNewState extends State<AddNew> {

  final titulo = TextEditingController();
  final contenido = TextEditingController();

  String titulor = "";
  String contenidor = "";
  String imagenn ="";

  _AddNewState(int idUsuario);

  void agregarnoticia(titulor, contenidor, imagen, idUsuario)async{
    try {
      var url = Uri.parse('${serve2}addnew.php');
      var response = await http.post(url, body: {
        'titulo' : titulor,
        'contenido' : contenidor,
        'user' : idUsuario.toString(),
        // 'foto' : imagen,
        // 'usuario' : 2,
      }).timeout(const Duration(seconds: 60));

      var datos = jsonDecode(response.body);

      if (datos) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage(0,0)));

      }else{
        
      }
    // ignore: empty_catches
    } on TimeoutException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar noticia')),
      body: Center(
        child: ListView(
          children: [Column(
            children: [
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: titulo,
                    decoration: const InputDecoration(
                    hintText: 'Titulo',
                    ),
                  ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: contenido,
                    decoration: const InputDecoration(
                    hintText: 'Contenido',
                    ),
                  ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    child: const Text('Agregar'),
                    onPressed: (){
                      titulor = titulo.text;
                      contenidor = contenido.text;
                      // imagenn = subir_imagen() as String;
                      agregarnoticia(titulor, contenidor, imagenn, idUsuario);
                    },
                    
                  ),
              ),

              // Container(
              //   padding: const EdgeInsets.all(15),
              //     child: ElevatedButton(
              //       child: const Text('Tomar foto'),
              //       onPressed: (){
              //         opciones(context);
              //       },
                    
              //     ),
              // ),
              // SizedBox(height: 20),
              // SizedBox(height: 30,),
              //     imagen == null ? Center(): Image.file(imagen!)
            ],
            
          ),]
        ),
      ),
    );
  }
}