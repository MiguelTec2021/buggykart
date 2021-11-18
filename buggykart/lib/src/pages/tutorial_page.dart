import 'package:flutter/material.dart';



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