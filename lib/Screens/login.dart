import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/register.dart';
import 'package:fyp/utils/color_utils.dart';
import 'package:fyp/utils/logo_widget.dart';
import 'Dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordTextController = TextEditingController();
  final _userTextController = TextEditingController();

  @override
  void dispose() {
    _userTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 90, 15, 0),
              child: Column(children: <Widget>[
                logoWidget("assets/images/sun.png"),
                const SizedBox(
                  height: 30,
                ),
                inputTextField("Enter Username", Icons.person_outline, false,
                    _userTextController, "Please Enter Username!"),
                const SizedBox(
                  height: 20,
                ),
                inputTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController, "Please Enter Password!"),
                const SizedBox(
                  height: 30,
                ),
                button(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _userTextController.text.trim(),
                          password: _passwordTextController.text.trim())
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const DashboardScreen()))))
                      .onError((error, stackTrace) {
                    if (error != null) {
                      if (error == 'user-not-found') {
                        // show toast
                        showToast(context, 'User does not exist!');
                      } else {
                        print(error);
                      }
                    }
                  });
                }),
                signOption(),
              ]),
            ))));
  }

  Row signOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't Have Account?", style: TextStyle(color: Colors.white)),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }

  void showToast(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
