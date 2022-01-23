import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  PerguntaApp({Key? key}) : super(key: key);

  final List<String> perguntas = [
    "Qual é a sua cor favorita?",
    "Qual é o seu animal favorito?",
  ];

  void responder() {
    print("repondido");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pergunta App"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(perguntas[0]),
              RaisedButton(
                onPressed: responder,
                child: Text("Resposta 1"),
              ),
              RaisedButton(
                onPressed: responder,
                child: Text("Resposta 2"),
              ),
              RaisedButton(
                onPressed: responder,
                child: Text("Resposta 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
