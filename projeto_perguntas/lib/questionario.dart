import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() quandoResponder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),

        /* Pegou a lista de Strings, transformou para uma lista de Widgets e depois o resultado do map em uma lista
             depois o spread colocou na lista de widget acima em children */
        ...respostas.map((texto) => Resposta(texto, quandoResponder)).toList(),
        // operador spread (...) adiciona todos os valores da lista em outra lista
      ],
    );
  }
}
