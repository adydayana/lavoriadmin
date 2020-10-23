import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lavori/firebaseauthservices.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Home Page',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
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
