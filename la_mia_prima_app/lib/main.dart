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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Benvenuti al Corso di Flutter'),
        ),
        body: RandomSuggestions(false),
      ),
    );
  }
}

class LaMiaTerzaApp extends StatelessWidget {
  const LaMiaTerzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La mia terza app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RandomSuggestions(true),
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
  bool _navigazioneAbilitata = false;

  RandomSuggestions(this._navigazioneAbilitata);

  @override
  _RandomSuggestionsState createState() =>
      _RandomSuggestionsState(this._navigazioneAbilitata);
}

class _RandomSuggestionsState extends State<RandomSuggestions> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _suggestionSaved = <WordPair>{};
  bool _navigazioneAbilitata = false;

  _RandomSuggestionsState(this._navigazioneAbilitata);

  @override
  Widget build(BuildContext context) {
    return _navigazioneAbilitata ? _terzaApp(context) : _buildList(context);
  }

  Widget _terzaApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La mia terza App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _goToSalvati,
            tooltip: 'Parole salvate',
          ),
        ],
      ),
      body: _buildList(context),
    );
  }

  _goToSalvati() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _suggestionSaved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Parole salvate'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRowWithIcon(_suggestions[index]);
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

  Widget _buildRowWithIcon(WordPair pair) {
    final alreadySaved = _suggestionSaved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Rimuovi' : 'Salva',
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _suggestionSaved.remove(pair);
          } else {
            _suggestionSaved.add(pair);
          }
        });
      },
    );
  }
}
