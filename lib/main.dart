import 'package:flutter/material.dart';

void main() {
  runApp(const MultiplicadorApp());
}

class MultiplicadorApp extends StatelessWidget {
  const MultiplicadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiplicador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MultiplicadorHomePage(),
    );
  }
}

class MultiplicadorHomePage extends StatefulWidget {
  const MultiplicadorHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MultiplicadorHomePageState createState() => _MultiplicadorHomePageState();
}

class _MultiplicadorHomePageState extends State<MultiplicadorHomePage> {
  final TextEditingController _numero1Controller = TextEditingController();
  final TextEditingController _numero2Controller = TextEditingController();
  String _resultado = '';

  void _multiplicar() {
    final double? numero1 = double.tryParse(_numero1Controller.text);
    final double? numero2 = double.tryParse(_numero2Controller.text);

    if (numero1 != null && numero2 != null) {
      final double produto = numero1 * numero2;
      setState(() {
        _resultado = 'Resultado: $produto';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira números válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiplicador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numero1Controller,
              decoration: const InputDecoration(
                labelText: 'Digite o primeiro número',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _numero2Controller,
              decoration: const InputDecoration(
                labelText: 'Digite o segundo número',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _multiplicar,
              child: const Text('Multiplicar'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}