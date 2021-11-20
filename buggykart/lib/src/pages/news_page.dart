import 'dart:convert';

import 'package:buggykart/src/pages/add_new.dart';
// import 'package:buggykart/src/pages/funciones/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'clases/data_news.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  bool loading = true;

  List<Data_news> data = <Data_news>[];

  // ignore: non_constant_identifier_names
  Future<List<Data_news>> tomar_datos()async{
    var url = Uri.parse('${serve}listNew.php');

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
      // appBar: AppBar(title: const Text('Noticias'),),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddNew(),fullscreenDialog: true), );
        },
      ),
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
                          decoration: const BoxDecoration(
                            // color: Colors.grey
                          ),
                          child: Text(data[index].titulo, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          // color: Colors.red,
                          width: 220,
                          height: 250,
                          child: const FadeInImage(
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            image: AssetImage('assets/Highway-logo-color.png',),
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        ListTile(
                          title: const Text('Descripción:'),
                          subtitle: Text(data[index].contenido),
                          tileColor: Colors.grey[300],
                        ),
                        const SizedBox(height: 10,),
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