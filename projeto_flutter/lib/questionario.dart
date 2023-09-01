import 'package:flutter/material.dart';

import 'questao.dart';
import 'respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  final int perguntaSelecionada;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntasSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntasSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
