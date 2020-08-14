import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main(List<String> args) => runApp(new PerguntaApp());

// dentro do genérics passamos qual o componente stateful que a gente deseja controlar
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = [
    {
      'texto': "Qual é a sua cor favorita?",
      'respostas': ["Verde", "Amarelo", "Vermelho", "Preto"],
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': ["Cavalo", "Porquinho da índia", "Coelho", "Aveztruz"],
    },
    {
      'texto': "Qual é a sua marca de chocolates favorita?",
      'respostas': ["Cacau Show", "Garoto", "Nestle", "Arcor"],
    },
  ];

  // altera o indice para trocar de pergunta
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada // operador ternério
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto']),

                  /* Pegou a lista de Strings, transformou para uma lista de Widgets e depois o resultado do map em uma lista
             depois o spread colocou la lista de widget acima em children */
                  ...respostas
                      .map((texto) => Resposta(texto, _responder))
                      .toList(),
                  // operador spread (...) adiciona todos os valores da lista em outra lista
                ],
              )
            : resultado(), // fim da operação ternária
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
