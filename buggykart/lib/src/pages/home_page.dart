import 'package:buggykart/src/pages/news_page.dart';
import 'package:buggykart/src/pages/perfil_page.dart';
import 'package:flutter/material.dart';

import 'funciones/login.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class HomePage extends StatefulWidget {
  int idUsuario = 0;
  int idrol = 0;
  HomePage(this.idUsuario,this.idrol,{Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(idUsuario);
}


class _HomePageState extends State<HomePage> {
  
  int _pagina =  0;
  final List<Widget> _paginas = [
    NewsPage(idUsuario, idrol),
    Perfil(idUsuario),
  ];

  _HomePageState(int idUsuario);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(title: Text(widget.idUsuario.toString()),),
      body: _paginas[_pagina],
      bottomNavigationBar:_navegacionBotton(),
      drawer: idrol==1 ? Drawer(): null,
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
        BottomNavigationBarItem(
          label: "Perfil",
          icon: Icon(Icons.person)
        ),
      ],
    );
  }
}