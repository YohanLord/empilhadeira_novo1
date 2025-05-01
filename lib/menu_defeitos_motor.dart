
import 'package:flutter/material.dart';
import 'diagnostico_motor_nao_funciona.dart'; // Importa a nova tela de passo a passo

class MenuDefeitosMotor extends StatelessWidget {
  const MenuDefeitosMotor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Defeitos do Motor'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.build_circle),
            title: const Text('Motor não funciona'),
            subtitle: const Text('Diagnóstico completo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DiagnosticoMotorNaoFunciona(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.speed),
            title: const Text('Motor falhando'),
            subtitle: const Text('Em breve disponível'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fluxo em desenvolvimento...')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.energy_savings_leaf),
            title: const Text('Motor não acelera'),
            subtitle: const Text('Em breve disponível'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fluxo em desenvolvimento...')),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
