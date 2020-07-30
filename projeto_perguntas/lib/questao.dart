import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // valor máximo para o double
      margin:
          EdgeInsets.all(10), //mg top, left, right e bottom com o valor 10px
      //EdgeInsets.fromLTRB(left, top, right, bottom) -> valores separados
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center, // alinha o texto para o centro
      ),
    );
  }
}
