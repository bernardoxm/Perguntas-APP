import 'package:flutter/material.dart';
class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao,this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'parabens!';
    } else if (pontuacao < 12) {
      return 'Voce e bom!';
    } else if (pontuacao < 16) {
      return 'impressionante!';
    } else {
      return 'Nivel jedi!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
           fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
           child: Text('Reiniciar'),
           // backgroundColor: Colors.blue,
           onPressed: quandoReiniciarQuestionario,
           
           ),
      ],
    );
  }
}
