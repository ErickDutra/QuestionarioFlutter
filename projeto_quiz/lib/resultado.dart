import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  PorcentagemPontuacao(pontuacao) {
    return ((pontuacao * 100) / 30) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularPercentIndicator(
            radius: 150,
            lineWidth: 20,
            percent: PorcentagemPontuacao(pontuacao),
            center: Text(
              pontuacao.toString() + ' Pontos',
              style: TextStyle(fontSize: 40),
            ),
            progressColor: Colors.green,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(backgroundColor:
              MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red;
            }
            return Colors.blue;
          })),
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar ?'),
        )
      ],
    );
  }
}
