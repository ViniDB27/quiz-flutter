import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressed;
  
  const Resposta({
    required this.texto,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(texto),
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
