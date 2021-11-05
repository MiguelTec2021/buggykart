import 'package:highway/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextStyle _textTitle = const TextStyle(
      fontFamily: 'MuseoModerno',
      fontSize: 40.0,
      color: Color.fromARGB(255, 3, 97, 141));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 450.0,
              width: 450.0,
              padding: const EdgeInsets.all(20.0),
              child: const FadeInImage(
                  placeholder: AssetImage('../assets/Highway-logo-color.png'),
                  image: AssetImage(
                    '../assets/Highway-logo-color.png',
                  )),
            ),
            const SizedBox(
              height: 60.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("Identificarse",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 3, 97, 141),
                  onPrimary: Color.fromARGB(255, 3, 97, 141),
                  padding: EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10)),
            )
          ],
        ),
      ),
    );
  }
}
