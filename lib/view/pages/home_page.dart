import 'package:flutter/material.dart';
import 'package:pattern_test/repository/message_repository.dart'; // Importa o repositório de mensagens.
import 'package:provider/provider.dart'; // Importa o package provider para gerenciamento de estado.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Adiciona um callback que será executado após o frame ser renderizado.
    // Isso garante que o contexto esteja disponível para acessar o repositório.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Acessa o MessageRepository usando o context.read, que fornece uma instância
      // do repositório a partir do Provider.
      // Chama o método setMessageContent para buscar a mensagem inicial.
      // Isso inicializa o estado do aplicativo com a primeira mensagem.
      context.read<MessageRepository>().setMessageContent();
    });
  }

  @override
  Widget build(BuildContext context) {
    // O Builder é usado aqui para garantir que o contexto esteja disponível
    // para o Consumer.
    return Builder(builder: (context) {
      // O Consumer<MessageRepository> escuta as mudanças no MessageRepository.
      // Sempre que o repositório notificar seus ouvintes (usando notifyListeners()),
      // o builder será executado novamente.
      return Consumer<MessageRepository>(
        builder: (context, messageRepository, child) {
          // O Scaffold é o widget raiz da página.
          return Scaffold(
            appBar: AppBar(
              title: const Text('Message'),
            ),
            // O body exibe um CircularProgressIndicator enquanto a mensagem
            // estiver sendo buscada (message == null).
            // Quando a mensagem estiver disponível, exibe o título da mensagem.
            body: Builder(builder: (context) {
              // Verifica se a mensagem já foi carregada.
              return messageRepository.message == null
                  // Exibe um indicador de carregamento circular enquanto a mensagem é buscada.
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  // Exibe o título da mensagem quando estiver disponível.
                  : Center(
                      child: Text(messageRepository.message!.title.toString()),
                    );
            }),
            // O FloatingActionButton permite atualizar a mensagem.
            floatingActionButton: FloatingActionButton(
              // Chama setMessageContent no repositório quando o botão é pressionado,
              // o que busca uma nova mensagem e notifica os ouvintes.
              onPressed: () {
                messageRepository.setMessageContent();
              },
              child: const Icon(Icons.refresh),
            ),
          );
        },
      );
    });
  }
}
