import 'package:buggykart/src/pages/login_page.dart';
import 'package:flutter/material.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextStyle _textTitle = const TextStyle(fontSize: 40.0, fontFamily: 'museoBold');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Comunidad', style: _textTitle,),
            Text('',style: _textTitle,),
            const SizedBox(height: 1,),
            Container(
              height: 250.0,
              padding: const EdgeInsets.all(20.0),
              child: const FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: AssetImage('assets/Highway-logo-color.png')),
            ),
            const SizedBox(height: 40.0,),
            Text('Bienvenido', style: _textTitle,),
            const SizedBox(height: 40.0,),
            const SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
              },
              child: const Text("Empezar",style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[700],
                onPrimary: Colors.blue)
              )
          ],
        ),
      ),
    );
  }
}