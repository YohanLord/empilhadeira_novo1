import 'menu_defeitos_motor.dart';
import 'diagnostico_motor.dart';

import 'package:flutter/material.dart';

void main() => runApp(DiagnosticoApp());

class DiagnosticoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagnóstico Empilhadeira',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: CadastroEmpilhadeiraScreen(),
    );
  }
}

class CadastroEmpilhadeiraScreen extends StatefulWidget {
  @override
  _CadastroEmpilhadeiraScreenState createState() => _CadastroEmpilhadeiraScreenState();
}

class _CadastroEmpilhadeiraScreenState extends State<CadastroEmpilhadeiraScreen> {
  final _formKey = GlobalKey<FormState>();
  String marca = '';
  String modelo = '';
  String numeroSerie = '';
  bool generico = false;

  void continuar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(
          marca: generico ? 'Genérico' : marca,
          modelo: generico ? 'Padrão' : modelo,
          numeroSerie: generico ? '000000' : numeroSerie,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro da Empilhadeira')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CheckboxListTile(
                title: Text('Usar empilhadeira genérica'),
                value: generico,
                onChanged: (value) => setState(() => generico = value ?? false),
              ),
              if (!generico) ...[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Marca'),
                  onChanged: (value) => marca = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Modelo'),
                  onChanged: (value) => modelo = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Número de Série'),
                  onChanged: (value) => numeroSerie = value,
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: continuar,
                child: Text('Continuar para Diagnóstico'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String marca;
  final String modelo;
  final String numeroSerie;

  HomeScreen({
    required this.marca,
    required this.modelo,
    required this.numeroSerie,
  });

  final List<Map<String, dynamic>> sistemas = [
    {'nome': 'Motor', 'imagem': 'motor.png', 'rota': MenuDefeitosMotor()},
    {'nome': 'Sistema Hidráulico', 'imagem': 'hidraulico.png'},
    {'nome': 'Sistema Elétrico', 'imagem': 'eletrico.png'},
    {'nome': 'Transmissão', 'imagem': 'transmissao.png'},
    {'nome': 'Rodas', 'imagem': 'roda.png'},
    {'nome': 'Direção / Suspensão', 'imagem': 'direcao.png'},
    {'nome': 'Freio', 'imagem': 'freio.png'},
    {'nome': 'Torre / Acessórios', 'imagem': 'torre.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diagnóstico - $marca / $modelo')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nº de Série: $numeroSerie', textAlign: TextAlign.center),
            SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: sistemas.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final sistema = sistemas[index];
                  return GestureDetector(
                    onTap: () {
                      if (sistema['rota'] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => sistema['rota']),
                        );
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                'assets/images/${sistema['imagem']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          sistema['nome'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Classe MotorScreen removida, substituída por DiagnosticoMotorScreen
