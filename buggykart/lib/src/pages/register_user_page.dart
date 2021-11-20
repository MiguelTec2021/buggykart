import 'package:buggykart/src/pages/funciones/registrarusuario.dart';
import 'package:flutter/material.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


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
              const FadeInImage(
                placeholder:  AssetImage('assets/load.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                image:  AssetImage('assets/Highway-logo-color.png'),
                fit: BoxFit.contain,
                height: 150,
                width: 150,
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
                    registrarUsuario(context, name, lasname, years, user, email, password);
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