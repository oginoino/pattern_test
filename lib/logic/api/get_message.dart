import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/message.dart';

// Função que busca uma mensagem de uma API.
Future<Message?> fetchMessage() async {
  // Gera um número aleatório entre 0 e 9 para simular a busca de mensagens diferentes.
  int randonInt = Random().nextInt(10);

  // URL da API com o número aleatório.
  String url = 'https://jsonplaceholder.typicode.com/todos/$randonInt';

  // Headers da requisição.
  Map<String, String> header = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  // Realiza a chamada GET para a API.
  final response = await http.get(
    Uri.parse(url),
    headers: header,
  );

  // Verifica se a requisição foi bem-sucedida (código 200).
  if (response.statusCode == 200) {
    // Decodifica o corpo da resposta (JSON) e cria um objeto Message a partir dele.
    // Retorna o objeto Message.
    return Message.fromJson(jsonDecode(response.body));
  } else {
    // Se a requisição falhar, retorna null.
    return null;
  }
}
