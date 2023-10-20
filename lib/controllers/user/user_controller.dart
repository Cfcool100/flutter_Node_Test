import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static Future<bool> authenticateUser(String phoneNumber, String password) async {
    final apiUrl = Uri.parse('http://localhost:3000/login'); // Remplacez par votre URL de connexion

    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Authentification réussie, stockez le token localement
      final Map<String, dynamic> data = json.decode(response.body);
      final String token = data['token']; // Le token reçu de l'API

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', token); // Stockez le token localement

      return true;
    } else {
      // Authentification échouée
      return false;
    }
  }
}
