// import 'package:buggykart/src/pages/home_page.dart';
import 'package:flutter/material.dart';


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Te
      // ),
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
                  decoration: const InputDecoration(
                    hintText: 'Constraseña',
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              // FlatButton(
              //   onPressed:(){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
              //   },
              //   color: Colors.red,
              //   shape: const StadiumBorder(),
              //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
              //   child: const Text('Empezar', style: TextStyle(color:Colors.white),) 
              //   ),
              ElevatedButton(
                onPressed: (){
                  user = usuario.text;
                  pass = contrasena.text;

                  if (user != '' && pass !="") {
                    // ingresar(user, pass);
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
                }, 
                child: const Text('Iniciar sesión', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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