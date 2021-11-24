import 'dart:convert';
import 'package:buggykart/src/pages/clases/data_users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class ListUsers extends StatefulWidget {
  ListUsers({Key? key}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  List<DataUsers> data = <DataUsers>[];


  Future<List<DataUsers>> tomarDatos()async{
    var url = Uri.parse('${serve2}listUsers.php');

    var response = await http.post(url).timeout(const Duration(seconds: 20));

    var datos = json.decode(response.body);

    var registros = <DataUsers>[];

    for (var datos in datos) {
      registros.add(DataUsers.fromJson(datos));
    }
    return registros;
  }

  Future eliminarusuario(int id)async{
    var url = Uri.parse('${serve2}delete.php');
    var response = await http.post(url, body: {
      'id': id.toString()
    }).timeout(const Duration(seconds: 20));
    var datos = json.decode(response.body);
    print("datos::::"+datos.toString());
    if (datos.toString() == '1') {

      print('eliminado');
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tomarDatos().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuarios'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add_sharp),
        onPressed: (){},
        ),
        
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 24,),
            // Container(
            //   color: Colors.teal,
            //   height: 50,
            //   width: 500,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: const[
            //       // Text('Nombre', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
            //       // Text('Apellidos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
            //       Text('Usuario', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
            //       Text('Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
            //     ],
            //   )
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Container(
                            //   padding: const EdgeInsets.all(10),
                            //   color: Colors.grey,
                            //   height: 40,
                            //   width: 100,
                            //   child: Text(data[index].nombre)
                            //   ),
                            // Container(
                            //   padding: const EdgeInsets.all(10),
                            //   color: Colors.grey,
                            //   height: 40,
                            //   width: 100,
                            //   child: Text(data[index].apellidos)
                            //   ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage('${serve2}fotos/'+data[index].foto),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              // color: Colors.grey,
                              height: 40,
                              width: 100,
                              child: Text(data[index].usuario)
                              ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              // color: Colors.grey,
                              height: 40,
                              width: 100,
                              child: Text(data[index].email)
                              ),
                            // const SizedBox(width: 20,),
                            // Text(data[index].apellidos),
                            // const SizedBox(width: 20,),
                            // Text(data[index].usuario),
                            // const SizedBox(width: 20,),
                            // Text(data[index].email),
                            // const SizedBox(width: 20,),
                            InkWell(
                              child: const Icon(Icons.delete, color: Colors.red,),
                              onTap: (){
                                print(data[index].idusuario);
                                eliminarusuario(data[index].idusuario);
                              },
                            ),
                            InkWell(
                              child: const Icon(Icons.edit, color: Colors.red,),
                              onTap: (){},
                            )
            
            
                          ],
                        )
                      ],
                    ),
                  );
                }
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}