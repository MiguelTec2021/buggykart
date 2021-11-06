import 'package:buggykart/src/pages/login_page.dart';
import 'package:flutter/material.dart';


class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextStyle _textTitle = const TextStyle(fontSize: 40.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Comunidad', style: _textTitle,),
            Text('Buggy Kart',style: _textTitle,),
            const SizedBox(height: 40,),
            Container(
              height: 100.0,
              padding: const EdgeInsets.all(20.0),
              child: const FadeInImage(
                placeholder: AssetImage('assets/logo_j_m.png'),
                image: AssetImage('assets/logo_j_m.png')),
            ),
            const SizedBox(height: 50.0,),
            Text('Bienvenido', style: _textTitle,),
            const SizedBox(height: 50.0,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text('Comunidad del juego Buggy Kart donde puede compartir su experiencia', textAlign: TextAlign.center, ),
            ),
            const SizedBox(height: 60.0,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
              },
              child: const Text("Empezar",style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.blue
              )
              
              )

          ],
        ),
      ),
    );
  }
}