import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuetionario;

  const Resultado({
    required this.pontuacao,
    required this.reiniciarQuetionario,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Parabéns',
            style: TextStyle(fontSize: 28),
          ),
          Text(
            'Pontos: $pontuacao',
            style: const TextStyle(fontSize: 22),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: reiniciarQuetionario,
              child: const Text(
                'Reiniciar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
