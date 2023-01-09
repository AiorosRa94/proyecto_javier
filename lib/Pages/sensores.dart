import 'package:flutter/material.dart';
import 'package:proyecto_javier/Apis/Sensores/ApiSensores.dart';

class Sensores extends StatelessWidget {
  String accessToken;

  Sensores({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    ApiSensores().getInfoSensores(accessToken);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sensores"),
            Text("Valor del access: $accessToken"),
          ],
        ),
      ),
    );
  }
}
