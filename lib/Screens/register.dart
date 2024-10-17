import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Dashboard.dart';
import 'package:fyp/utils/color_utils.dart';
import 'package:fyp/utils/logo_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp/utils/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.reference().child('users');

  final _emailText = TextEditingController();
  final _fullnameText = TextEditingController();
  final _usernameText = TextEditingController();
  final _confirmPassText = TextEditingController();
  final _passwordText = TextEditingController();

  // Implement the user registration function
  Future<void> _registerUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailText.text,
        password: _passwordText.text,
      );

      // Store additional user data in the Realtime Database
      Users user = Users(
        uid: userCredential.user!.uid,
        fullname: _fullnameText.text,
        username: _usernameText.text,
        email: _emailText.text,
        password: _passwordText.text,
        confirmpassword: _confirmPassText.text,
      );

      await _userRef.child(user.uid!).set(user.toJson());

      // Navigate to the dashboard screen after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Register', style: TextStyle(color: Colors.white))),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("804FB3"),
            hexStringToColor("9969C7"),
            hexStringToColor("B589D6")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                  child: Column(children: <Widget>[
                    const Text('Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 30,
                    ),
                    inputTextField("Enter Your Fullname", Icons.person_remove,
                        false, _fullnameText, "Please Enter fullname!"),
                    const SizedBox(
                      height: 30,
                    ),
                    inputTextField("Enter Username", Icons.person_pin, false,
                        _usernameText, "Please Enter username!"),
                    const SizedBox(
                      height: 30,
                    ),
                    inputTextField(
                        "Enter Email",
                        Icons.alternate_email_outlined,
                        false,
                        _emailText,
                        "Please Enter email!"),
                    const SizedBox(
                      height: 30,
                    ),
                    inputTextField("Enter Password", Icons.lock_outline, true,
                        _passwordText, "Please Enter Password!"),
                    const SizedBox(
                      height: 30,
                    ),
                    inputTextField(
                        "Enter Confirm Password",
                        Icons.password,
                        true,
                        _confirmPassText,
                        "Please Enter Confirm Password!"),
                    const SizedBox(
                      height: 30,
                    ),
                    button(context, false, () {
                      _registerUser();
                    })
                  ])))),
    );
  }
}
