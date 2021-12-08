import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const LaMiaPrimaApp());
}

class LaMiaPrimaApp extends StatelessWidget {
  const LaMiaPrimaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'La mia prima App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Benvenuti al Corso di Flutter'),
        ),
        // body: RandomWords(),
        body: const Center(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              'Mi chiamo Giuseppe Trisciuoglio e sono il vostro professore di Flutter.'),
        )),
      ),
    );
  }
}

class LaMiaSecondaApp extends StatelessWidget {
  const LaMiaSecondaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La mia seconda App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Benvenuti al Corso di Flutter'),
        ),
        body: RandomSuggestions(),
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
    return Center(child: Text(wordPair.asPascalCase));
  }
}

class RandomSuggestions extends StatefulWidget {
  @override
  _RandomSuggestionsState createState() => _RandomSuggestionsState();
}

class _RandomSuggestionsState extends State<RandomSuggestions> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
