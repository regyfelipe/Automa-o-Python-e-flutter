import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> executarPython(String parametro) async {
  final url = Uri.parse('http://192.168.18.11:5000/executar');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'parametro': parametro}),
    );

    if (response.statusCode == 200) {
      final resultado = jsonDecode(response.body);
      return resultado['resultado'] ?? 'Resultado vazio';
    } else {
      final erro = jsonDecode(response.body);
      return 'Erro: ${erro['mensagem'] ?? 'Erro desconhecido'}';
    }
  } catch (e) {
    return 'Erro ao conectar-se ao servidor: $e';
  }
}
