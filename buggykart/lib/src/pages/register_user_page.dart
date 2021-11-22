import 'package:buggykart/src/pages/funciones/registrarusuario.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';
String foto ="";


class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {

  final nombre = TextEditingController();
  final apellidos = TextEditingController();
  final edad = TextEditingController();
  final usuario = TextEditingController();
  final correo = TextEditingController();
  final contra = TextEditingController();

  String name = "";
  String lasname = "";
  String years = "";
  String user = "";
  String email = "";
  String password = "";
  String fotou = "";

  File? imagen ;

  final picker = ImagePicker();

  Future selImage(op)async{

    var pickerFile;
    if(op == 1){
      // ignore: deprecated_member_use
      pickerFile = await picker.pickImage(source: ImageSource.camera);
    }else{
      // ignore: deprecated_member_use
      pickerFile = await picker.pickImage(source: ImageSource.gallery); 
    }

    setState(() {
      if(pickerFile != null){
        imagen = File(pickerFile.path);
        // cortar(File(pickerFile.path));
      }else{
        // ignore: avoid_print
        print('No seleccionaste');
      }
      Navigator.of(context).pop();

    });
  }
  Dio dio = Dio();

  Future<void> subir_imagen()async{
    try {
      String filename = imagen!.path.split('/').last;

      FormData formData = FormData.fromMap({
        // 'usuario': 'ideusuario',
        // 'nombre' : 'nombre',
        'file' : await MultipartFile.fromFile(
          imagen!.path, filename: filename
        )
      }); 
      String imagens;

      var response = await dio.post('${serve}subir.php',
      data : formData);

      foto = response.toString();

      print('nombre de la foto: '+ foto);


    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Registrar nuevo usuario'),),
      body: Center(
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 2),
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0,),
              Row(
              
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20,),
                  InkWell(
                    child: const Icon(Icons.arrow_back,size: 30,),
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const FadeInImage(
                  placeholder:  AssetImage('assets/load.gif'),
                  fadeInDuration: Duration(milliseconds: 200),
                  image:  AssetImage('assets/Highway-logo-color.png'),
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,
                  ),
                  InkWell(
                    child: const Icon(Icons.add_a_photo, size: 35,),
                    onTap:(){
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      selImage(1);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border(bottom:  BorderSide(
                                          width: 1,
                                          color: Colors.grey
                                        ))
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Tomar una foto', style: TextStyle(fontSize: 16),),
                                          ),
                                          Icon(Icons.camera_alt, color: Colors.blue,),

                                        ],
                                      ),
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: (){
                                  //       selImage(2);
                                  //   },
                                  //   child: Container(
                                  //     padding: EdgeInsets.all(20),
                                  //     child: Row(
                                  //       children: [
                                  //         Expanded(
                                  //           child: Text('Selecionar una foto', style: TextStyle(fontSize: 16),),
                                  //         ),
                                  //         Icon(Icons.image, color: Colors.blue,),

                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.red
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Cancelar', style: TextStyle(fontSize: 16, color: Colors.white ,), textAlign: TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                    }
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const Text('Crear cuenta', style: TextStyle(fontFamily: 'museoBold', fontSize: 30.0),),
              const SizedBox(height: 10.0,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: nombre,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: apellidos,
                  decoration: const InputDecoration(
                    hintText: 'Apellidos',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: edad,
                  decoration: const InputDecoration(
                    hintText: 'edad',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: usuario,
                  decoration: const InputDecoration(
                    hintText: 'Usuario',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: correo,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: contra,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Contraseña',
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  name = nombre.text;
                  lasname = apellidos.text;
                  years = edad.text;
                  user = usuario.text;
                  email = correo.text;
                  password = contra.text;

                  if (name != '' && lasname != '' && years != '' && user != '' && email != '' && password!= '') {
                    // ingresar(context,user, pass);
                    registrarUsuario(context, name, foto, lasname, years, user, email, password);
                    subir_imagen();
                  }else{
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                          child: AlertDialog(
                            title: const Text('HIGWAY'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Center(
                                    child: Column(
                                      children: const [
                                        Text('Debes llenar todos los campos'),
                                        Icon(Icons.assignment_late_rounded, color: Colors.amber, size: 100,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text('Aceptar',),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[700],
                                ),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      });
                  }

                  nombre.text = "";
                  apellidos.text = "";
                  edad.text = "";
                  usuario.text = "";
                  correo.text = "";
                  contra.text = "";


                }, 
                child: const Text('Registrar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  )
                ),
            ],
          ),
          ]
        ),
      ),
    );
  }
}