import 'package:flutter/material.dart';
import './questionario.dart';
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
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
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
