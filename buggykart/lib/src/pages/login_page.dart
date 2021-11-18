// import 'package:buggykart/src/pages/home_page.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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

  void ingresar(useri, passi)async{
    try {
      var url = Uri.parse('http://192.168.56.1/apps/server.php');
      var response = await http.post(url, body: {
        'usuario' : useri,
        'password' :passi,
        }
      ).timeout( const Duration(seconds: 60));

      var data = jsonDecode(response.body);

      int index =0;
      print(response.body);

      if (response.body!='0') {
        Navigator.pushNamed(context, '/home',);
      }else{
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
                placeholder:  AssetImage('assets/jar-loading.gif'),
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
                    ingresar(user, pass);
                  }else{
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('HIGWAY'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const [
                                Text('Verifica tus datos'),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              child: const Text('Aceptar',),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            )
                          ],
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