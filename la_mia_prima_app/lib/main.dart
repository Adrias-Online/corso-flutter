import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const LaMiaPrimaApp());
}

class LaMiaPrimaApp extends StatelessWidget {
  const LaMiaPrimaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La mia prima App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Benvenuti al Corso di Flutter'),
        ),
        body: const Center(
          child: Text('Mi chiamo Giuseppe Trisciuoglio e sono il vostro professore di Flutter.'),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
