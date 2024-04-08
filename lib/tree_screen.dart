import 'package:flutter/material.dart';

class TreeScreen extends StatelessWidget {
  final int donations;
  final int donationGoal = 100; // Establece tu objetivo de donaciones

  const TreeScreen({Key? key, this.donations = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Árbol de Donaciones'),
        backgroundColor:
            Colors.green, // Personalizar el color de la barra de aplicaciones
        actions: [
          IconButton(
            icon: const Icon(
                Icons.share), // Cambiar el botón "Más" por "Compartir"
            onPressed: () {
              // Lógica para compartir en redes sociales
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildThankYouMessage(),
                const SizedBox(height: 16.0),
                _buildTreeImage(),
                const SizedBox(height: 16.0),
                _buildDonationsList(),
                const SizedBox(height: 32.0),
                _buildTrophySection(),
                const SizedBox(
                  height: 16.0,
                ),
                _buildDonationMessage(),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThankYouMessage() {
    return const Text(
      '¡Gracias por tu donación!',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTreeImage() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
        ], // Agregar sombras a la imagen
        borderRadius: BorderRadius.circular(10), // Añadir bordes redondeados
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/tree.jpeg', // Asegúrate de tener una imagen de un árbol en la carpeta assets
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDonationsList() {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Donaciones Recientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 350, // Aumentar la altura para hacerla más grande
              child: ListView.builder(
                itemCount:
                    8, // Aumentar el número de donaciones recientes mostradas
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Donante $index'),
                    subtitle: Text('Cantidad donada: \$${(index + 1) * 10}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationMessage() {
    String donationMessage = '';
    if (donations == 0) {
      donationMessage = 'Cada donación cuenta, ¡gracias por tu apoyo!';
    } else if (donations < 50) {
      donationMessage = 'Tu generosidad está haciendo la diferencia.';
    } else {
      donationMessage = '¡Increíble! Gracias por tu gran contribución.';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        donationMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _buildTrophySection() {
    return Column(
      children: [
        const Text(
          'Trofeos del Mes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTrophyIcon(Icons.favorite, 'Mayor Donante'),
            _buildTrophyIcon(Icons.eco, 'Mayor Concientizador'),
            _buildTrophyIcon(Icons.star, 'Mayor Impacto'),
          ],
        ),
      ],
    );
  }

  Widget _buildTrophyIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40.0,
          color: Colors.amber,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
