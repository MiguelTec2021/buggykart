import 'dart:convert';
import 'package:buggykart/src/pages/clases/data_user.dart';
import 'package:buggykart/src/pages/funciones/login.dart';
import 'package:buggykart/src/pages/listusers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


Future<DataUser> fetchAlbum(id) async {
  var url = Uri.parse('${serve2}user/datos.php');
  final response = await http
      .post(url, body: {
        'index' : id.toString()
      });

  if (response.statusCode == 200) {
    var datos = jsonDecode(response.body);
    return DataUser.fromJson(datos[0]);
  } else {
    throw Exception('Error');
  }
}

class Perfil extends StatefulWidget {
  const Perfil(int idUsuario, {Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<DataUser> user;

  @override
  void initState() {
    super.initState();
    user = fetchAlbum(idUsuario);
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
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Column(
                        children: const [
                            FadeInImage(
                            placeholder: AssetImage('assets/load.gif'),
                            image: AssetImage('assets/back.jpeg'),
                            height: 200,
                            width: 480,
                            fit: BoxFit.cover,
                            // image: NetworkImage('http://192.168.56.1/apps/fotos/eri.jpg'),
                          ),
                          SizedBox(height: 0.0),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          _fotodeperfil(snapshot.data!.foto),
                          const SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("Usuario: "+snapshot.data!.usuario, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                              const SizedBox(width: 100,),
                              Text(snapshot.data!.nombreRol, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.teal,
                    height: 420,
                    alignment: Alignment.center,
                    
                    child: snapshot.data!.idrol==1 ?  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('Lista de usuarios'),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListUsers(),fullscreenDialog: true),);
                          },
                        ),
                        const SizedBox(height: 40,),
                        ElevatedButton(
                          child: const Text('Lista de mensajes'),
                          onPressed: (){

                          }
                        ),
                        const SizedBox(height: 40,),
                        ElevatedButton(
                          child: const Text('Lista de noticias'),
                          onPressed: (){

                          }
                        ),
                      ],
                    ): Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('Editar perfil'),
                          onPressed: (){

                          },
                        ),
                        
                        ElevatedButton(
                          child: const Text('Cambiar contraseña'),
                          onPressed: (){

                          },
                        ),
                      ],
                    ),
                  )
                    // SizedBox(height: 10.0,)
                ],
              );
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  Widget _fotodeperfil(fotou){
    final foto = Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInImage(
            alignment: Alignment.center,
            placeholder: const AssetImage('assets/load.gif'),
            image: NetworkImage('${serve2}fotos/'+fotou),
            // image: const AssetImage('assets/load.gif'),
            fadeInDuration: const  Duration(milliseconds: 200),
            height: 100,
            fit: BoxFit.cover,
          ),
          // Image(image: NetworkImage('http://192.168.56.1/apps/fotos/eri.jpg'))
          
        ],
        
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: ClipRRect(
        child: foto,
        borderRadius: BorderRadius.circular(60.0),
      ),
    );
  }
}