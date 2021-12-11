import 'package:flutter/material.dart';

void main() {
  runApp(ImpariamoANavigareApp());
}

class ImpariamoANavigareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeNavScreen(),
    );
  }
}

class HomeNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Navigazione'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Andiamo alla seconda pagina'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SecondaPaginaScreen();
              }),
            );
          },
        ),
      ),
    );
  }
}

class SecondaPaginaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seconda Pagina'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}