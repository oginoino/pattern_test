import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/pattern_app.dart';
import 'repository/message_repository.dart';

void main() {
  runApp(
    // MultiProvider permite que você use vários provedores juntos.
    // Isso é útil quando você tem vários repositórios ou outros objetos
    // que precisam ser acessíveis em toda a aplicação.
    MultiProvider(
      providers: [
        // ChangeNotifierProvider cria uma instância de MessageRepository
        // e a disponibiliza para todos os widgets abaixo na árvore de widgets.
        // ChangeNotifierProvider é usado porque MessageRepository usa ChangeNotifier,
        // o que permite que ele notifique os ouvintes quando seus dados mudam.
        ChangeNotifierProvider(
          // create é uma função que retorna uma nova instância de MessageRepository.
          // Isso garante que apenas uma instância do repositório seja criada.
          create: (context) => MessageRepository(),
          // child: const PatternApp(), // O child agora é definido no MultiProvider.
        ),
      ],
      // PatternApp é o widget raiz do aplicativo.
      // Ao colocá-lo como filho do MultiProvider, todos os widgets dentro
      // de PatternApp podem acessar os provedores definidos acima.
      child: const PatternApp(),
    ),
  );
}
