import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _pagina = 0;
  final List<Widget> _paginas = [
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Login')
      // ),
      body: _paginas[_pagina],
      bottomNavigationBar:_navegacionBotton(),
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
          label: "Tutoriales",
          icon: Icon(Icons.extension_rounded)
        ),
      ],
    );
  }
}