import 'package:flutter/material.dart';
void alerrt(context,valor){
     showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                          child: AlertDialog(
                            title: const Text('HIGWAY'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text("Verifica: "+valor),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text('Aceptar',),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[700],
                                ),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      });

}                
                
             