import 'package:flutter/material.dart';
import 'package:googlesign/Pages/HomePage.dart';
import 'package:googlesign/Service/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Google Button
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    final credenciales = await AuthService().signInWithGoogle();

                    debugPrint(credenciales.user?.displayName);
                    debugPrint(credenciales.user?.photoURL);
                    debugPrint(credenciales.user?.email);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Continua con Google"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
