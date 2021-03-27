import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Marrom', 'pontuacao': 3},
        {'texto': 'Rosa', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 5},
        {'texto': 'Capivara', 'pontuacao': 3},
        {'texto': 'Elefante', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito',
      'resposta': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'Paulo', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Ana', 'pontuacao': 1}
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print('teste');
  }

  void reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Container(
                  width: double.infinity,
                  child: Text(
                    'Perguntas',
                    textAlign: TextAlign.center,
                  )),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder)
                : Resultado(_pontuacaoTotal, reiniciarQuestionario)));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
