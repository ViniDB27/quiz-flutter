import 'package:flutter/material.dart';
import 'package:quiz/widgets/questao.dart';
import 'package:quiz/widgets/resposta.dart';

class Questionario extends StatelessWidget {
  final String pergunta;
  final List<Map<String, Object>> respostas;
  final void Function(Map<String, Object> respsota) responder;

  const Questionario({
    required this.pergunta,
    required this.respostas,
    required this.responder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Questao(pergunta),
          ...respostas
              .map(
                (textResp) => Resposta(
                  texto: textResp["texto"].toString(),
                  onPressed: () => responder(textResp),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
