// UserProfileView.dart (Flutter)
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/user/user_controller.dart';
import '../../home.dart';

class UserProfileView extends StatefulWidget {

  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
  final phoneNumber = phoneNumberController.text;
  final password = passwordController.text;

  final success = await LoginController.authenticateUser(phoneNumber, password);

  if (success) {
    // Authentification réussie, naviguer vers une autre page
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage())); // Remplacez par votre page de destination
  } else {
    // Authentification échouée, afficher un message d'erreur
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Authentification échouée'),
          content: const Text('Le numéro de téléphone ou le mot de passe est incorrect.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Numéro de téléphone'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Mot de passe (4 chiffres)'),
            ),
            ElevatedButton(
              onPressed: login,
              child: const Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
