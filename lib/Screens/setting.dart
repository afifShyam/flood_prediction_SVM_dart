import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref('users');

  UserData? _userData;
  bool _passwordVisible = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // Update profile
  Future<void> _updateProfile() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      // User not logged in
      return;
    }

    final userUid = currentUser.uid;

    final updatedData = {
      'fullname': _userData!.name,
      'email': _userData!.email,
      'username': _userData!.username,
    };

    await _userRef.child(userUid).update(updatedData);

    setState(() {
      _isLoading = false;
    });
  }

  // Delete account
  Future<void> _deleteAccount() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      // User not logged in
      return;
    }

    await currentUser.delete();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _fetchUserData() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      // User not logged in
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final userUid = currentUser.uid;

    try {
      final snapshot = await _userRef.child(userUid).get();

      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final fullname = data['fullname'] ?? '';
        final email = data['email'] ?? '';
        final username = data['username'] ?? '';
        final password = data['password'] ??
            ''; // You can remove this line if you don't need to display the password.

        setState(() {
          _userData = UserData(fullname, email, username, password);
          _isLoading = false;
        });
      } else {
        // User data not found in the database
        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      // Handle error
      print("Error fetching user data: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("282828"),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userData == null
              ? const Center(child: Text('User data not found.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: Text("Username"),
                          subtitle: Text(_userData!.username),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: Text(_userData!.name),
                          subtitle: Text(_userData!.email),
                        ),
                      ),
                      Card(
                          child: ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Password'),
                        subtitle: Text(
                          // This will obfuscate the text
                          // if _passwordVisible is false, then show asterisks
                          _passwordVisible ? _userData!.password : '*********',
                          style: const TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          // This will toggle the password visibility
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )),
                    ],
                  ),
                ),
    );
  }
}

class UserData {
  late String name;
  late String email;
  late String username;
  late String password;

  UserData(this.name, this.email, this.username, this.password);
}
