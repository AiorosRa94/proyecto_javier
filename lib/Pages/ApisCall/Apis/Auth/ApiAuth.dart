import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_javier/Pages/ApisCall/Apis/Auth/Estructuras/EstructuraAuth.dart';

class ApiAuth {
  Future<EstructuraAuth?> Auth(String usuario, String contrasenia) async {
    final String headerAuth = 'Basic ${base64Encode(utf8.encode('$usuario:$contrasenia'))}';
    if (kDebugMode) {
      print("https://www.digitplan.com/oauth");
    }

    final response = await http.post(Uri.parse("https://www.digitplan.com/oauth"),
        headers: <String, String>{'authorization': headerAuth, 'Content-Type': 'application/x-www-form-urlencoded'}, body: <String, String>{'grant_type': 'client_credentials'});

    if (response.statusCode == 200) {
      EstructuraAuth? respuesta;
      try {
        respuesta = EstructuraAuth.fromJson(jsonDecode(response.body));
        return respuesta;
      } catch (e, s) {
        if (!kDebugMode) {}
        print("Error al tratar de convertir: ${e.toString()}");
        print("${s.toString()}");
        return null;
      }
    } else {
      return null;
    }
  }
}
