import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_javier/Apis/Auth/ApiAuth.dart';
import 'package:proyecto_javier/Apis/Auth/Estructuras/EstructuraAuth.dart';
import 'package:proyecto_javier/Pages/sensores.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controladorUsuario = TextEditingController();
    TextEditingController controladorContrasenia = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: CupertinoTextField(
                  controller: controladorUsuario,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.blue)),
                  placeholder: "Usuario",
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: CupertinoTextField(
                    controller: controladorContrasenia,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.blue)),
                    placeholder: "Contraseña",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    EstructuraAuth? res = await ApiAuth().Auth(controladorUsuario.text, controladorContrasenia.text);

                    if (res?.accessToken == null) {
                      print("No puedes acceder");
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Sensores(accessToken: res?.accessToken ?? ""))));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(width: 3, color: Colors.green), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Login", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
