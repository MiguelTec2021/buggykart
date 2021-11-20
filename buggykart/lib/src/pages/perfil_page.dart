import 'package:flutter/material.dart';
String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                const FadeInImage(
                  placeholder: AssetImage('assets/load.gif'),
                  image: AssetImage('assets/back.jpeg',),          
                  
                ),
                Row(
                  children: [
                    const FadeInImage(
                      placeholder: AssetImage('assets/load.gif'),
                      image: AssetImage('assets/person.jpg',),          
                      width: 80,
                      height: 80,
                      ),
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Nombre del usuario: ', style: TextStyle(fontSize: 20, color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Email: ', style: TextStyle(fontSize: 20, color: Colors.white),),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const  [
                Text('Puntuaje: 1000'),
                Text('Nivel: 1'),
              ],
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Editar perfil'),
            ),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Cmabiar contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}