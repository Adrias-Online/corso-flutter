import 'package:flutter/material.dart';

const COLOR_ADRIAS = Color.fromRGBO(0, 151, 197, 1.0);

void main() {
  runApp(const LaMiaTerzaApp());
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
      initialRoute: '/row',
      routes: {
        '/': (context) => const HomeScreen(),
        '/text': (context) => const TextScreen(),
        '/row': (context) => LoginScreen(),
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
      home: ChatScreen(),
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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Backoffice"),
        backgroundColor: COLOR_ADRIAS,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('asset/images/logo-adriasonline.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Inserisci una mail valida'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Inserisci una password sicura'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Password dimenticata',
                style: TextStyle(color: COLOR_ADRIAS, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: COLOR_ADRIAS, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Accedi',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.email), Text('Accedi alla webmail')],
            ),
          ],
        ),
      ),
    );
  }
}

class Contact {
  String firstName;
  String lastName;
  String phoneNumber;
  String avatarUrl;
  int code;
  Contact(this.firstName, this.lastName, this.phoneNumber, this.avatarUrl, this.code);
}


class ChatScreen extends StatelessWidget {

  List<Contact> contactsList = [
    Contact("Giuseppe", "Trisciuoglio", "+393490715232", "https://www.gravatar.com/avatar/7b0c5d1850c460319e9140c921672a4a", 1),
    Contact("Federica", "Piersimoni", "+393470223132", "https://www.gravatar.com/avatar/443fe3b412ea61efc90e42c350eee0a5", 2),
    Contact("Francesco", "Piersimoni", "+393370223131", "https://www.gravatar.com/avatar/2afd1cfcb16a708d21842536e2c8a94a", 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat Dipendenti"),
          backgroundColor: COLOR_ADRIAS,
        ),
        body: SafeArea(
            child: ListView.separated(
              itemCount: contactsList.length,
              separatorBuilder: (context, index) => Divider(height: 2.0),
              itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(contactsList[index].avatarUrl),
                  ),
                  title: Text(contactsList[index].firstName + " " + contactsList[index].lastName ),
                  subtitle: Text(contactsList[index].phoneNumber),
                  trailing: Icon(Icons.arrow_forward),
                ),
            )));
  }
}