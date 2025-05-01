
import 'package:flutter/material.dart';

class DiagnosticoMotorNaoFunciona extends StatefulWidget {
  @override
  _DiagnosticoMotorNaoFuncionaState createState() => _DiagnosticoMotorNaoFuncionaState();
}

class _DiagnosticoMotorNaoFuncionaState extends State<DiagnosticoMotorNaoFunciona> {
  int currentStep = 0;

  final List<Map<String, String>> passos = [
    {
      "instrucao": "Ajuste o multímetro na escala de 20V DC. Encoste a ponta preta no terminal negativo (-) e a vermelha no positivo (+). Leia a tensão no visor. Valor esperado: acima de 12,4V.",
      "ferramenta": "Multímetro Digital",
    },
    {
      "instrucao": "Inspecione visualmente os terminais da bateria e certifique-se de que estão bem fixos e sem sinais de corrosão.",
      "ferramenta": "Chave de boca 13mm ou 10mm",
    },
    {
      "instrucao": "Verifique o nível de gás no cilindro de GLP. Se necessário, substitua o cilindro vazio.",
      "ferramenta": "Inspeção Visual",
    },
    {
      "instrucao": "Confirme se a mangueira de gás está corretamente conectada e sem danos visíveis.",
      "ferramenta": "Inspeção Manual",
    },
    {
      "instrucao": "Verifique o fusível principal do sistema. Faça o teste de continuidade.",
      "ferramenta": "Multímetro Digital",
    },
    {
      "instrucao": "Teste o relé de partida removendo e medindo continuidade entre os terminais.",
      "ferramenta": "Multímetro Digital",
    },
    {
      "instrucao": "Verifique a tensão chegando ao motor de partida durante a tentativa de partida.",
      "ferramenta": "Multímetro Digital",
    },
    {
      "instrucao": "Teste os sensores de segurança do assento e pedais, assegurando que estejam fechando circuito.",
      "ferramenta": "Multímetro Digital ou Scanner Simples",
    },
  ];

  void proximoPasso() {
    if (currentStep < passos.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => DiagnosticoConcluidoPage(),
      ));
    }
  }

  void problemaSolucionado() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => DiagnosticoConcluidoPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final passoAtual = passos[currentStep];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico Motor Não Funciona'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🔢 Passo ${currentStep + 1} de ${passos.length}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('📄 Instrução:', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(passoAtual['instrucao'] ?? '', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            Text('🔧 Ferramenta necessária:', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(passoAtual['ferramenta'] ?? '', style: const TextStyle(fontSize: 18)),
            const Spacer(),
            Text('✅ O problema foi solucionado após este teste?', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: problemaSolucionado,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('✅ Problema Solucionado'),
                ),
                ElevatedButton(
                  onPressed: proximoPasso,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('➡️ Continuar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiagnosticoConcluidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico Concluído'),
      ),
      body: const Center(
        child: Text(
          '✅ Diagnóstico concluído com sucesso!\n\nParabéns!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
