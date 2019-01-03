import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:trying_out_flutter/random_words.dart';

class RandomWordsState extends State<RandomWords> {
  final _saved = <WordPair>[];
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Username Generator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSavedSuggestions,
          )
        ],
      ),
      body: Center(child: _buildSuggestions()),
    );
  }

  String _wordPairToUsername(WordPair wordPair) {
    return '${wordPair.first.toLowerCase()}-${wordPair.second.toLowerCase()}';
  }

  Iterable<ListTile> _makeListTiles() {
    return _saved.map((wordPair) {
      return ListTile(
        title: Text(
          _wordPairToUsername(wordPair),
          style: _biggerFont,
        ),
      );
    });
  }

  void _pushSavedSuggestions() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        final Iterable<ListTile> listTiles = _makeListTiles();
        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: listTiles).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Saved Suggestions"),
          ),
          body: ListView(children: divided),
        );
      }),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider(height: 18.0);

          final closestWordPairIndex =
              index ~/ 2; // To calc the actual index of the word pair
          if (closestWordPairIndex >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[closestWordPairIndex]);
        });
  }

  void _updateState(bool alreadySaved, WordPair pair) {
    setState(() {
      if (alreadySaved) {
        _saved.remove(pair);
      } else {
        _saved.add(pair);
      }
    });
  }

  Widget _buildRow(WordPair wordPair) {
    final bool alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Text(
        _wordPairToUsername(wordPair),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () => _updateState(alreadySaved, wordPair),
    );
  }
}
