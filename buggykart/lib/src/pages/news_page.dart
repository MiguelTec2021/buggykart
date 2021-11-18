import 'dart:convert';

import 'package:buggykart/src/pages/add_new.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'clases/data_news.dart';


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
    var url = Uri.parse('http://192.168.56.1/apps/listNew.php');

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
      appBar: AppBar(title: const Text('Noticias'),),
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
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          width: 400,
                          height: 100,
                          child: const FadeInImage(
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            image: AssetImage('assets/R.jpg',),
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Text(data[index].titulo),
                          subtitle: Text(data[index].contenido),
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