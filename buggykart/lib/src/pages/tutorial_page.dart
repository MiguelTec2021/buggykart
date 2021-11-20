import 'package:flutter/material.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';

class TutorialesPage extends StatelessWidget {
  const TutorialesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          children:const  [
            Text('Tutoriales')
          ],
        ),
      ),
    );
  }
}