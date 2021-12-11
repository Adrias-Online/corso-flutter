import 'package:flutter/material.dart';

void main() {
  runApp(LaMiaSecondaApp());
}

class LaMiaSecondaApp extends StatelessWidget {
  const LaMiaSecondaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/text': (context) => const TextScreen(),
      },
    );
  }
}

class LaMiaTerzaApp extends StatelessWidget {
  const LaMiaTerzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black12
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La mia seconda APP'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/text'),
              icon: Icon(Icons.one_k)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/row'),
              icon: Icon(Icons.ten_k)),
        ],
      ),
      body: Center(
        child: Text('Come state ragazzi?'),
      ),
    );
  }
}

class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Esempi'),
      ),
      body: Stack(children: [
        Positioned(
            bottom: 0,
            child: const Text(
              'Testo 1',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            )),
        Text(
          'Testo 2',
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 100),
        ),
        Text(
          'Testo 2',
          textAlign: TextAlign.right,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
        ),
      ]),
    );
  }
}