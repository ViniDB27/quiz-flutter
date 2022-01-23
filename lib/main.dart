import 'package:flutter/material.dart';
import 'package:quiz/widgets/questionario.dart';
import 'package:quiz/widgets/resultado.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSel = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "nota": 10},
        {"texto": "Vermelho", "nota": 5},
        {"texto": "Verde", "nota": 3},
        {"texto": "Branco", "nota": 1},
      ]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "nota": 10},
        {"texto": "Cobra", "nota": 5},
        {"texto": "Elefante", "nota": 3},
        {"texto": "Leão", "nota": 1},
      ]
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": [
        {"texto": "Maria", "nota": 10},
        {"texto": "João", "nota": 5},
        {"texto": "Leo", "nota": 3},
        {"texto": "Pedro", "nota": 1},
      ]
    },
  ];

  bool get temPerguntaSelecioanda {
    return _perguntaSel < _perguntas.length;
  }

  void _responder(Map<String, Object> resp) {
    if (temPerguntaSelecioanda) {
      setState(() {
        _perguntaSel++;
        _pontuacaoTotal += int.parse(resp['nota'].toString());
      });
    }
  }

  void restart() {
    setState(() {
      _perguntaSel = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecioanda
        ? _perguntas[_perguntaSel].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pergunta App"),
        ),
        body: temPerguntaSelecioanda
            ? Questionario(
                pergunta: _perguntas[_perguntaSel]['texto'].toString(),
                respostas: respostas,
                responder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciarQuetionario: restart,
              ),
      ),
    );
  }
}
