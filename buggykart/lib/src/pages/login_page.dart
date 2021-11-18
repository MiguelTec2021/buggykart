import 'package:flutter/material.dart';
import 'funciones/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usuario = TextEditingController();
  final contrasena = TextEditingController();

  String user = "";
  String pass = "";
  String serve = 'http://192.168.56.1/apps/';
  String serve2 = 'https://proyecttjyw.000webhostapp.com/';

  // bool lod = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(image:  AssetImage('assets/jar-loading.gif'),),
              const SizedBox(height: 70.0,),
              const FadeInImage(
                placeholder:  AssetImage('assets/load.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                image:  AssetImage('assets/Highway-logo-color.png'),
                fit: BoxFit.contain,
                height: 200,
                width: 200,
                ),
              const SizedBox(height: 20,),
              const Text('Iniciar Sesión', style: TextStyle(fontFamily: 'museoBold', fontSize: 30.0),),
              const SizedBox(height: 20.0,),
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
                  controller: contrasena,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Constraseña',
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: (){
                  user = usuario.text;
                  pass = contrasena.text;
                  if (user != '' && pass !="") {
                    ingresar(context,user, pass);
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
                  usuario.text = "";
                  contrasena.text ="";
                }, 
                child: const Text('Iniciar sesión', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  )
                ),
                const SizedBox(height: 20,),
                InkWell(
                  child:const  Text('No tienes cuenta'),
                  onTap: (){
                    Navigator.pushNamed(context, '/register',);
                  },
                )
            ],
          ),
          ]
        ),
      ),
    );
  }
}