import 'package:flutter/material.dart';

import '../page/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          //brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(title: 'App Cpf'),
    );
  }
}
