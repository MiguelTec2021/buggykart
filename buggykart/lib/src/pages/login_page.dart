import 'package:highway/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Te
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Iniciar sesión",
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 97, 141), fontSize: 30.0)),
            const SizedBox(
              height: 70.0,
            ),
            const FadeInImage(
              placeholder: AssetImage('../assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 0),
              image: AssetImage('../assets/Highway-logo-color.png'),
              fit: BoxFit.contain,
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 60.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: const TextField(
                style: TextStyle(
                    fontSize: 17.0, color: Color.fromARGB(255, 3, 97, 141)),
                decoration: InputDecoration(
                  hintText: 'Ingresa tu usuario',
                  contentPadding: EdgeInsets.only(left: 20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: TextField(
                style: TextStyle(
                    fontSize: 17.0, color: Color.fromARGB(255, 3, 97, 141)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0, top: 10.0),
                    hintText: 'Ingresa tu contraseña',
                    isDense: true,
                    suffixIcon: Container(
                        transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                        child: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          iconSize: 20,
                          splashRadius: 1,
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ))),
                obscureText: _isObscure,
                obscuringCharacter: "*",
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                color: Color.fromARGB(255, 3, 97, 141),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 30.0),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
