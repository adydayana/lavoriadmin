import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lavori/firebaseauthservices.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Lavori Admin"),
      ),
        drawer: Drawer(
    child: ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.emoji_objects),
          title: Text('Evaluate Service'),
        ),
                ListTile(
          leading: Icon(Icons.people_alt_rounded),
          title: Text('Manage Vendor'),
        ),
                ListTile(
          leading: Icon(Icons.people),
          title: Text('Manage Customer'),
        ),
        ListTile(
          leading: Icon(Icons.data_usage),
          title: Text('Manage Service'),
        ),
        ListTile(
          leading: Icon(Icons.payments),
          title: Text('Payment Admin Vendor'),
        ),
      ],
    ),
  ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            RaisedButton(
              onPressed: () {
                context.read<FirebaseAuthService>().signOut();
              },
              child: Text(Strings.signOut),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  );
                }
              }
              
              class Strings {

                 static const String signOut = 'Sign out';

  static String signInMessage;

  // General
}
