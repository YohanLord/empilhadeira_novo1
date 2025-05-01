
import 'package:flutter/material.dart';

class DiagnosticoMotorScreen extends StatefulWidget {
  @override
  _DiagnosticoMotorScreenState createState() => _DiagnosticoMotorScreenState();
}

class _DiagnosticoMotorScreenState extends State<DiagnosticoMotorScreen> {
  int _etapa = 0;

  final List<Map<String, String>> _perguntas = [
    {
      "pergunta": "O motor gira ao dar partida?",
      "sim": "Verifique se há faísca na vela de ignição.",
      "nao": "Verifique o estado da bateria e do motor de partida."
    },
    {
      "pergunta": "Há faísca na vela?",
      "sim": "Verifique se está chegando combustível ao carburador.",
      "nao": "Verifique a bobina de ignição e o cabo da vela."
    },
  ];

  String? _resposta;

  void _responder(String resposta) {
    setState(() {
      _resposta = _perguntas[_etapa][resposta.toLowerCase()];
      if (_etapa < _perguntas.length - 1) {
        _etapa++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = _perguntas[_etapa];
    return Scaffold(
      appBar: AppBar(title: Text('Diagnóstico - Motor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(perguntaAtual["pergunta"]!, style: TextStyle(fontSize: 20)),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _responder("sim"),
              child: Text("Sim"),
            ),
            ElevatedButton(
              onPressed: () => _responder("nao"),
              child: Text("Não"),
            ),
            SizedBox(height: 24),
            if (_resposta != null)
              Text(
                _resposta!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
          ],
        ),
      ),
    );
  }
}
