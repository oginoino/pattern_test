import 'package:flutter/material.dart';

import '../view/pages/home_page.dart';

class PatternApp extends StatelessWidget {
  const PatternApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
