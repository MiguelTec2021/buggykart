import 'package:buggykart/src/pages/news_page.dart';
import 'package:buggykart/src/pages/perfil_page.dart';
import 'package:flutter/material.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String nombre ="";

  int _pagina = 0;
  final List<Widget> _paginas = [
    const NewsPage(),
    // const TutorialesPage(),
    const Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_pagina],
      bottomNavigationBar:_navegacionBotton(),
      drawer: const Drawer(
        child: Text(''),
      ),
    );
  }

  Widget _navegacionBotton(){
    return BottomNavigationBar(
      onTap: (index){
        setState(() {
          _pagina = index;
        });
      },
      currentIndex: _pagina,
      items: const [
        BottomNavigationBarItem(
          label: "Noticias",
          icon: Icon(Icons.fiber_new_sharp)
        ),
        // BottomNavigationBarItem(
        //   label: "Tutoriales",
        //   icon: Icon(Icons.extension_rounded)
        // ),
        BottomNavigationBarItem(
          label: "Perfil",
          icon: Icon(Icons.person)
        ),
      ],
    );
  }
}