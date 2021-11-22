import 'dart:convert';
// import 'package:buggykart/src/pages/add_new.dart';
// import 'package:buggykart/src/pages/funciones/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'clases/data_news.dart';

String serve = 'http://192.168.56.1/apps/';
String serve2 = 'https://proyecttjyw.000webhostapp.com/';


class NewsUser extends StatefulWidget {
  const NewsUser({Key? key}) : super(key: key);

  @override
  State<NewsUser> createState() => _NewsUserState();
}

class _NewsUserState extends State<NewsUser> {

  bool loading = true;

  List<Data_news> data = <Data_news>[];

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
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child:Image.asset('assets/Highway-logo-color.png'),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.0),
                                  Text(data[index].nombreU),
                                  Text(data[index].titulo, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.black,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            border: Border(
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
                          title: Text(data[index].contenido),
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