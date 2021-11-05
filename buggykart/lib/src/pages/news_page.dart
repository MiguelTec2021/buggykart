import 'package:flutter/material.dart';


class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Noticias'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Noticias'),
            Container(
              // decoration: ,
              padding: const EdgeInsets.all(30),
              child:Column(
                children: const [
                  Image(
                    image: NetworkImage('https://s1.eestatic.com/2018/12/19/elandroidelibre/el_androide_libre_361977453_181932670_1200x584.jpg')),
                    Text('Inciar juego', style: TextStyle(fontSize: 20),),
                    Text('La primera versión de juego de buggy kart')

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}