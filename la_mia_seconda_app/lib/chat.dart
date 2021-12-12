import 'package:flutter/material.dart';

const COLOR_ADRIAS = Color.fromRGBO(0, 151, 197, 1.0);

void main() {
  runApp(ChatApp());
}

class Contact {
  String firstName;
  String lastName;
  String phoneNumber;
  String avatarUrl;
  int code;

  Contact(this.firstName, this.lastName, this.phoneNumber, this.avatarUrl,
      this.code);

  @override
  String toString() {
    return '$firstName $lastName';
  }

}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
      theme: _myCustomThemeData(),
    );
  }
}

ThemeData _myCustomThemeData() {
  return ThemeData(
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: COLOR_ADRIAS,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(
      secondary: Colors.lightGreen,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
  );
}

class ChatScreen extends StatelessWidget {

  List<Contact> contactsList = [
    Contact("Giuseppe", "Trisciuoglio", "+393490715232",
        "https://www.gravatar.com/avatar/7b0c5d1850c460319e9140c921672a4a", 1),
    Contact("Federica", "Piersimoni", "+393470223132",
        "https://www.gravatar.com/avatar/443fe3b412ea61efc90e42c350eee0a5", 2),
    Contact("Francesco", "Piersimoni", "+393370223131",
        "https://www.gravatar.com/avatar/2afd1cfcb16a708d21842536e2c8a94a", 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat Dipendenti"),
          backgroundColor: COLOR_ADRIAS,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: SafeArea(
            child: ListView.separated(
              itemCount: contactsList.length,
              separatorBuilder: (context, index) => Divider(height: 2.0),
              itemBuilder: (context, index) =>
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          contactsList[index].avatarUrl),
                    ),
                    title: Text(contactsList[index].firstName + " " +
                        contactsList[index].lastName, style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(contactsList[index].phoneNumber),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Route route = MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailScreen(contactsList[index]),
                      );
                      Navigator.push(context, route);
                      // Navigator.pushNamed(context, '/chat_details', arguments: contactsList[index]);
                    },
                  ),
            )));
  }
}

class ChatDetailScreen extends StatelessWidget {
  Contact contact;

  ChatDetailScreen(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$contact"),
          backgroundColor: COLOR_ADRIAS,
        ),
        body: SafeArea(child: Text("$contact"),)
    );
  }
}

class ChatDetailScreen2 extends StatefulWidget {
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen2> {
  late Contact contact;

  @override
  Widget build(BuildContext context) {
    RouteSettings? settings = ModalRoute
        .of(context)
        ?.settings;
    contact = (settings?.arguments as Contact?)!;
    return Scaffold(
      appBar: AppBar(
        title: Text("$contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(contact.phoneNumber),
      ),
    );
  }
}