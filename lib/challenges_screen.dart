import 'package:flutter/material.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retos Mensuales'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Información sobre el reto mensual actual
            Text(
              'Reto del Mes',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            // Puedes personalizar el diseño de la información del reto mensual
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Título del Reto',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Descripción del Reto...',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Agrega aquí la lógica para iniciar el reto
                    },
                    child: const Text('Iniciar Reto'),
                  ),
                ],
              ),
            ),
            // Puedes agregar más elementos aquí según sea necesario
          ],
        ),
      ),
    );
  }
}
