import 'package:flutter/material.dart';
import 'package:lavori/home.dart';
import 'package:provider/provider.dart';
import 'package:lavori/firebaseauthservices.dart';
import 'login.dart';
import 'models/user.dart';

void main() => runApp(
      /// Inject the [FirebaseAuthService]
      /// and provide a stream of [User]
      ///
      /// This needs to be above [MaterialApp]
      /// At the top of the widget tree, to
      /// accomodate for navigations in the app
      MultiProvider(
        providers: [
          Provider(
            create: (_) => FirebaseAuthService(),
          ),
          StreamProvider(
            create: (context) =>
                context.read<FirebaseAuthService>().onAuthStateChanged,
          ),
        ],
        child: LavoriAdmin(),
      ),
    );

class LavoriAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lavori Admin',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Consumer<User>(
        builder: (_, user, __) {
          if (user == null) {
            return const Login();
          } else {
            return const Home();
          }
        },
      ),
    );
  }
}
