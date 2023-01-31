import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual e a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 8},
        {'texto': 'Azul', 'pontuacao': 6},
        {'texto': 'Verde', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual e o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 8},
        {'texto': 'Papagaio', 'pontuacao': 6},
        {'texto': 'Cavalo', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual e o seu esporte favorito?',
      'respostas': [
        {'texto': 'Futebol', 'pontuacao': 10},
        {'texto': 'Basquete', 'pontuacao': 8},
        {'texto': 'Natação', 'pontuacao': 6},
        {'texto': 'Volei', 'pontuacao': 4},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
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
