import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main(List<String> args) => runApp(new PerguntaApp());

// dentro do genérics passamos qual o componente stateful que a gente deseja controlar
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = [
    {
      'texto': "Qual é a sua cor favorita?",
      'respostas': [
        {"texto": "Verde", "pontuacao": 10},
        {"texto": "Amarelo", "pontuacao": 5},
        {"texto": "Vermelho", "pontuacao": 3},
        {"texto": "Preto", "pontuacao": 1},
      ],
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {"texto": "Porquinho da índia", "pontuacao": 8},
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Aveztruz", "pontuacao": 5},
        {"texto": "Cavalo", "pontuacao": 4},
      ],
    },
    {
      'texto': "Qual é a sua marca de chocolates favorita?",
      'respostas': [
        {"texto": "Cacau Show", "pontuacao": 6},
        {"texto": "Garoto", "pontuacao": 7},
        {"texto": "Nestle", "pontuacao": 8},
        {"texto": "Arcor", "pontuacao": 3},
      ],
    },
  ];

  // altera o indice para trocar de pergunta
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada // operador ternério
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(), // fim da operação ternária
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
