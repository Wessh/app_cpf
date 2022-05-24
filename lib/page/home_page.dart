import 'package:app_cpf/page/home_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final hs = HomeStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset('assets/images/undraw_enter.png', width: 250),
                TextField(
                  onChanged: hs.setCpf,
                  maxLength: 14,
                  decoration: const InputDecoration(
                    label: Text('CPF'),
                    counterText: '',
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //print(hs.isValid);
                    });
                  },
                  child: const Center(
                    child: Text('Validar'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  hs.isValid.isNotEmpty
                      ? 'Cpf é \n${hs.isValid.contains('true') ? 'válido ✅' : 'inválido ❎'}'
                      : '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
