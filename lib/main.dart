import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chin\'s random system controller',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _groupController = TextEditingController();
  final TextEditingController _rangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Chin\'s random system controller'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Random Lockpol',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _rangeController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.data_object),
                      filled: true,
                      labelText: 'Range of number random',
                      hintText: ''
                    ),
                  ),
                  TextField(
                    controller: _groupController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.data_array),
                      filled: true,
                      labelText: 'Group Random',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Update data'),
        icon: const Icon(Icons.upload),
        onPressed: () async {
          String _num =
              _rangeController.text != '' ? _rangeController.text : 'null';
          String name =
              _groupController.text != '' ? _groupController.text : 'null';
          await http.get(
            Uri.parse('achinhchin-random-system-server.vercel.app/num/$_num'),
          );
          await http.get(
            Uri.parse('achinhchin-random-system-server.vercel.app/name/$name'),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
