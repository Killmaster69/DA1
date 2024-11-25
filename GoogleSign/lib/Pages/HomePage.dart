import 'package:flutter/material.dart';
import 'package:googlesign/Service/auth_service.dart';
import 'package:googlesign/Pages/LoginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hola"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().sigOut(); // Cierra sesión
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false, // Elimina todas las rutas anteriores
                  );
                },
                child: const Text("Cerrar sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
