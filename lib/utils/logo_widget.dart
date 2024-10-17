import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/dashboard.dart';
import '../Screens/flood_info.dart';
import '../Screens/login.dart';
import '../Screens/setting.dart';
import '../utils/color_utils.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

Image smallLogo(String imageName) {
  return Image.asset(
    imageName,
    width: 30,
    height: 30,
  );
}

TextFormField inputTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, String validation) {
  return TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white54.withOpacity(0.8)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validation;
        }
        return null;
      });
}

Container button(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blueGrey;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}

TextFormField inputPrediction(
    String text, TextEditingController controller, String validation) {
  return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.white54.withOpacity(0.8)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 1, style: BorderStyle.none)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validation;
        }
        return null;
      });
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: hexStringToColor("8D538D"),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Flood Prediction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 52),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginScreen()))));
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const DashboardScreen())));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const SettingScreen())));
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('About'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const FloodInfoPage())));
          },
        ),
      ],
    ),
  );
}
