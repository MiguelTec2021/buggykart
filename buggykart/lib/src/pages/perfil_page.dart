import 'dart:convert';
import 'dart:js';
import 'package:buggykart/src/pages/clases/data_user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


Future<DataUser> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('${serve}user/datos.php'));

  if (response.statusCode == 200) {
    var datos = jsonDecode(response.body);
    return DataUser.fromJson(datos[0]);
  } else {
    throw Exception('Error');
  }
}

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<DataUser> user;

  @override
  void initState() {
    super.initState();
    user = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Perfil'),
      // ),
      body: Center(
        child: FutureBuilder<DataUser>(
          future: user,
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return Text(snapshot.data!.nombre);
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}