import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AutomacaoPage(),
    );
  }
}

class AutomacaoPage extends StatefulWidget {
  const AutomacaoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AutomacaoPageState createState() => _AutomacaoPageState();
}

class _AutomacaoPageState extends State<AutomacaoPage> {
  String statusMessage = 'Pressione o botão para executar o script';

  Future<void> executarScript(String parametro) async {
    setState(() {
      statusMessage = 'Executando script...';
    });

    try {
      final url = Uri.parse('http://192.168.18.11:5000/executar');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'parametro': parametro}),
      );

      if (response.statusCode == 200) {
        final resultado = jsonDecode(response.body);
        setState(() {
          statusMessage = 'Sucesso: ${resultado['resultado']}';
        });
      } else {
        setState(() {
          statusMessage = 'Erro: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = 'Erro ao conectar ao servidor: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: const Text(
          'Automação com Flutter e Python',
          style: TextStyle(
            color: Colors.white,
          ),
          
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.code,
              size: 100,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 20),
            const Text(
              'Automação com Flutter e Python',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await executarScript('buscar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Executar Script',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              statusMessage,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
