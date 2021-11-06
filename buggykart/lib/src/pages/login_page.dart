import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Te
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image:  AssetImage('assets/jar-loading.gif'),),
            const FadeInImage(
              placeholder:  AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              image:  AssetImage('assets/logo_j_m.png'),
              fit: BoxFit.contain,
              height: 200,
              width: 200,
              ),
              
            const Text('Iniciar Sesión'),
            const SizedBox(height: 40.0,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Usuario',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Constraseña',
                ),
              ),
            ),
            SizedBox(height: 100,),

            FlatButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
              },
              color: Colors.red,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
              child: const Text('Empezar', style: TextStyle(color:Colors.white),) 
              ),
          ],
        ),
      ),
    );
  }
}