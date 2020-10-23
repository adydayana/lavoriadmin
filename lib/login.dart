import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lavori/googlebutton.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(context.read),
      builder: (_, child) {
        return const Scaffold(
          body: LoginBody._(),
        );
      },
    );
  }
}

class SignInViewModel extends ChangeNotifier {
  SignInViewModel(this.locator);

  final Locator locator;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
}

class LoginBody extends StatelessWidget {
  const LoginBody._({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return Center(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 150, vertical: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          width: double.infinity,
          height: 650.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:18.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(80.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: isLoading
                            ? _loadingIndicator()
                            : _signInButtons(context),
                      ),
                    ],
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image.asset(
                        "images/LavoriLogo.png",
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Column _signInButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const GoogleSignInButton(),
        const Spacer(),
      ],
    );
  }
}
