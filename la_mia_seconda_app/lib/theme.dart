import 'package:flutter/material.dart';
const COLOR_ADRIAS = Color.fromRGBO(0, 151, 197, 1.0);

void main() {
  runApp(ThemeApp());
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Esempio con ThemeData';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_ADRIAS,
        fontFamily: 'Arial',
        textTheme: const TextTheme(
           headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
           headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
           bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),

        ),
      ),
      home: const HomePageScreen(
        title: appName,
      ),
    );
  }
}

class HomePageScreen extends StatelessWidget {
  final String title;

  const HomePageScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Text(
            'Testo con background color',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.red),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}