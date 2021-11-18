import 'package:buggykart/src/pages/add_new.dart';
// import 'package:buggykart/src/pages/home_page.dart';
import 'package:buggykart/src/pages/login_page.dart';
import 'package:buggykart/src/pages/register_user_page.dart';
import 'package:buggykart/src/pages/start_page.dart';
import 'package:flutter/material.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIGHWAY',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: StartPage(),
      initialRoute: '/',
      routes: {
        '/'        : (context) => const StartPage(),
        '/login'   : (context) => const LoginPage(),
        // '/home'    : (context) =>const HomePage(),
        '/addnew'  : (context) =>  const AddNew(),
        '/register': (context) => const RegisterUserPage(),

      },
    );
  }
}