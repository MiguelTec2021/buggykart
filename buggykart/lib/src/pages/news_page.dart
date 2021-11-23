import 'dart:convert';

import 'package:buggykart/src/pages/add_new.dart';
import 'package:buggykart/src/pages/funciones/login.dart';
// import 'package:buggykart/src/pages/funciones/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'clases/data_news.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class NewsPage extends StatefulWidget {
  const NewsPage(int idUsuario, int idrol, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<NewsPage> createState() => _NewsPageState(idUsuario);
}

class _NewsPageState extends State<NewsPage> {

  bool loading = true;
  int rol = 1;

  List<Data_news> data = <Data_news>[];

  _NewsPageState(int idUsuario);

  // ignore: non_constant_identifier_names
  Future<List<Data_news>> tomar_datos()async{
    var url = Uri.parse('${serve2}listNew.php');

    var response = await http.post(url).timeout(const Duration(seconds: 60));

    var datos = json.decode(response.body);

    var registros = <Data_news>[];

    for (var datos in datos) {
      registros.add(Data_news.fromJson(datos));
    }

    return registros;
  }

  @override
  void initState() {
    super.initState();
    tomar_datos().then((value){
      setState(() {
        data.addAll(value);
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: idrol == 1 ? FloatingActionButton( child: const Icon(Icons.add),
        onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddNew(idUsuario),fullscreenDialog: true),);},
      ): null
      ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Expanded(
              child: loading == true ? const Center(
                child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator(),),
              ): ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child:Image.asset('assets/Highway-logo-color.png'),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5.0),
                                  Text(data[index].nombreU, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                  Text(data[index].titulo, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.black,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            border: const Border(
                              bottom: BorderSide(
                                // color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          // color: Colors.red,
                          width: 450,
                          height: 100,
                          child: const FadeInImage(
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            image: AssetImage('assets/Highway-logo-color.png',),
                            // fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ListTile(
                          title: Text(data[index].contenido, style: const TextStyle(fontSize: 14),),
                          // subtitle: Text(data[index].contenido),
                          tileColor: Colors.grey[300],
                        ),
                        // const SizedBox(height: 10,),
                      ],
                    ),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}