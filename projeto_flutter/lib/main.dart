import 'package:flutter/material.dart';

import './questionario.dart';
import './resultado.dart';


main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'qual e sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 4},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'qual seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Leao', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'Joao', 'pontuacao': 4},
        {'texto': 'Pedro', 'pontuacao': 1},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntasSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });

      print(_perguntaSelecionada);
    }
  }

  bool get temPerguntasSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('perguntas'),
        ),
        body: temPerguntasSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
