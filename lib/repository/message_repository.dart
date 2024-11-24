import 'package:flutter/material.dart';

import '../logic/api/get_message.dart'; // Importa a função da api que busca a mensagem.
import '../models/message.dart'; // Importa o modelo de dados da mensagem.

// Classe repositório com ChangeNotifier para notificar ouvintes sobre mudanças.
class MessageRepository with ChangeNotifier {
  Message? _message; // Variável privada para armazenar a mensagem.

  // Setter assíncrono para definir o conteúdo da mensagem.
  Future<void> setMessageContent() async {
    _message =
        null; // Define a mensagem como nula inicialmente, útil para exibir um indicador de carregamento.
    notifyListeners(); // Notifica os ouvintes (Widgets) que a mensagem mudou (para nulo).

    _message =
        await fetchMessage(); // Busca a mensagem usando a função da api fetchMessage().
    notifyListeners(); // Notifica os ouvintes que a mensagem foi atualizada com os novos dados.
  }

  // Getter para acessar a mensagem.
  Message? get message => _message;
}
