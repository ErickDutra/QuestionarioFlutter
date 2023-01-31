import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resposta extends StatelessWidget {
  final String textoResposta;
  final void Function() onSelect;

  Resposta(this.textoResposta, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor:
            MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green;
          }
          return Colors.blue;
        })),
        onPressed: onSelect,
        child: Text(textoResposta),
      ),
    );
  }
}
