import 'package:flutter/material.dart';
import 'package:quiz/widgets/questao.dart';
import 'package:quiz/widgets/resposta.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSel = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": ["Preto", "Vermelho", "Verde", "Branco"]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": ["Coelho", "Cobra", "Elefante", "Leão"]
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": ["Maria", "João", "Leo", "Pedro"]
    }
  ];

  void _responder(String resp) {
    if (_perguntaSel < (_perguntas.length - 1)) {
      setState(() {
        _perguntaSel++;
      });
    }
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = _perguntas[_perguntaSel].cast()['respostas'];

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
              Questao(_perguntas[_perguntaSel]['texto'].toString()),
              ...respostas.map(
                (textResp) => Resposta(
                  texto: textResp,
                  onPressed: () => _responder(textResp),
                ),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
