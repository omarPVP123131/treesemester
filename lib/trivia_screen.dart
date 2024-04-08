// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  int incorrectAttempts = 0;
  final int maxIncorrectAttempts = 3;
  bool? isAnsweredCorrectly;

  List<Map<String, Object>> triviaData = [
    {
      'question': '¿Cuál es el componente principal de una computadora?',
      'options': ['Procesador', 'Disco Duro', 'Tarjeta de Video', 'Placa Base'],
      'correctAnswer': 'Procesador',
    },

    {
      'question': '¿Cuál de las siguientes memorias es volátil?',
      'options': ['RAM', 'ROM', 'Disco Duro', 'USB'],
      'correctAnswer': 'RAM',
    },
    {
      'question':
          '¿Cuál es el protocolo de transferencia de archivos en la web?',
      'options': ['FTP', 'HTTP', 'SMTP', 'SSH'],
      'correctAnswer': 'FTP',
    },
    {
      'question': '¿Qué significa la sigla "CPU"?',
      'options': [
        'Central Processing Unit',
        'Computer Personal Unit',
        'Central Process Unit',
        'Central Processor Unit'
      ],
      'correctAnswer': 'Central Processing Unit',
    },
    {
      'question':
          '¿Cuál es el lenguaje de programación más utilizado en el desarrollo de aplicaciones móviles?',
      'options': ['Java', 'Swift', 'JavaScript', 'Kotlin'],
      'correctAnswer': 'JavaScript',
    },
    {
      'question': '¿Cuál de los siguientes no es un sistema operativo?',
      'options': ['Ubuntu', 'iOS', 'Microsoft Office', 'Android'],
      'correctAnswer': 'Microsoft Office',
    },
    {
      'question':
          '¿Cuál es el nombre del sistema operativo de código abierto basado en el núcleo de Linux?',
      'options': ['Ubuntu', 'Windows', 'macOS', 'Fedora'],
      'correctAnswer': 'Ubuntu',
    },
    {
      'question':
          '¿Qué significa la sigla "HTML" en el contexto de desarrollo web?',
      'options': [
        'Hypertext Markup Language',
        'Hyper Transfer Markup Language',
        'High-Level Text Markup Language',
        'Hypertext Transfer Protocol'
      ],
      'correctAnswer': 'Hypertext Markup Language',
    },
    {
      'question':
          '¿Cuál es el propósito principal de una GPU en una computadora?',
      'options': [
        'Procesamiento gráfico',
        'Almacenamiento de datos',
        'Seguridad del sistema',
        'Procesamiento de audio'
      ],
      'correctAnswer': 'Procesamiento gráfico',
    },
    {
      'question':
          '¿Qué tipo de software permite a los usuarios navegar por sitios web?',
      'options': [
        'Navegador web',
        'Antivirus',
        'Sistema operativo',
        'Cliente de correo'
      ],
      'correctAnswer': 'Navegador web',
    },
    {
      'question':
          '¿Cuál es el estándar de red inalámbrica comúnmente utilizado para conexiones a corta distancia?',
      'options': ['Bluetooth', 'Wi-Fi', 'NFC', '4G'],
      'correctAnswer': 'Bluetooth',
    },
    {
      'question': '¿Cuál es el nombre del fundador de Microsoft?',
      'options': ['Bill Gates', 'Steve Jobs', 'Mark Zuckerberg', 'Elon Musk'],
      'correctAnswer': 'Bill Gates',
    },
    {
      'question': '¿Qué significa la sigla "URL"?',
      'options': [
        'Uniform Resource Locator',
        'Universal Reference Locator',
        'Unified Resource Locator',
        'Uniform Reference Locator'
      ],
      'correctAnswer': 'Uniform Resource Locator',
    },
    {
      'question':
          '¿En qué década se introdujo la primera computadora personal?',
      'options': ['1970s', '1980s', '1990s', '1960s'],
      'correctAnswer': '1970s',
    },
    {
      'question': '¿Cuál es el componente principal de una tarjeta madre?',
      'options': ['CPU', 'RAM', 'Chipset', 'GPU'],
      'correctAnswer': 'Chipset',
    },
    {
      'question': '¿Qué compañía desarrolló el sistema operativo Android?',
      'options': ['Google', 'Apple', 'Microsoft', 'Samsung'],
      'correctAnswer': 'Google',
    },
    {
      'question':
          '¿Cuál es el propósito de un firewall en una red informática?',
      'options': [
        'Seguridad',
        'Almacenamiento',
        'Conectividad',
        'Procesamiento de datos'
      ],
      'correctAnswer': 'Seguridad',
    },
    {
      'question':
          '¿Cuál de los siguientes es un lenguaje de programación de alto nivel?',
      'options': ['Python', 'Assembly', 'C', 'Binary'],
      'correctAnswer': 'Python',
    },
    {
      'question':
          '¿Cuál es el nombre del sistema de archivos utilizado por macOS?',
      'options': ['HFS+', 'NTFS', 'EXT4', 'APFS'],
      'correctAnswer': 'HFS+',
    },
    {
      'question': '¿En qué año se lanzó el primer iPhone?',
      'options': ['2006', '2007', '2008', '2005'],
      'correctAnswer': '2007',
    },
    {
      'question': '¿Cuál es el propósito de una dirección IP?',
      'options': [
        'Identificar dispositivos en una red',
        'Reproducir audio',
        'Enviar correos electrónicos',
        'Navegar por internet'
      ],
      'correctAnswer': 'Identificar dispositivos en una red',
    },
    {
      'question':
          '¿Qué impacto tiene el reciclaje adecuado de equipos de cómputo en el medio ambiente?',
      'options': [
        'Reduce la contaminación ambiental',
        'Aumenta las emisiones de gases de efecto invernadero',
        'Contribuye al agotamiento de recursos naturales',
        'Mejora la calidad del aire'
      ],
      'correctAnswer': 'Reduce la contaminación ambiental',
    },
// Agrega más preguntas según sea necesario
  ];

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    triviaData.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            const Text('Trivia Educativa'),
            const SizedBox(width: 96.0),
            ..._buildLives(),
          ],
        ),
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
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                _buildQuestion(),
                const SizedBox(height: 40),
                _buildOptions(),
                const SizedBox(height: 40),
                _buildFeedbackMessage(),
                const SizedBox(height: 80),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLives() {
    return List.generate(
      maxIncorrectAttempts - incorrectAttempts,
      (index) => const Icon(
        Icons.favorite,
        color: Colors.red,
        size: 24.0,
      ),
    );
  }

  Widget _buildQuestion() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        'Pregunta ${currentQuestionIndex + 1}: ${triviaData[currentQuestionIndex]['question'] as String}',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: List.generate(
        (triviaData[currentQuestionIndex]['options'] as List<String>).length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              _checkAnswer((triviaData[currentQuestionIndex]['options']
                  as List<String>)[index]);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      String.fromCharCode(65 + index), // A, B, C, ...
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    (triviaData[currentQuestionIndex]['options']
                        as List<String>)[index],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackMessage() {
    if (isAnsweredCorrectly != null) {
      return Column(
        children: [
          if (!isAnsweredCorrectly!)
            Text(
              'Respuestas correctas hasta ahora: $correctAnswersCount',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  void _showCongratulations() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 60,
              ),
              const SizedBox(height: 16),
              const Text(
                '¡Felicitaciones!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '¡Respuesta Correcta!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el diálogo de felicitación
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTryAgain() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.close,
                color: Colors.red,
                size: 60,
              ),
              const SizedBox(height: 16),
              const Text(
                'Respuesta Incorrecta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Inténtalo de nuevo.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Cierra el diálogo de intentar nuevamente
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAnswer(String selectedAnswer) {
    String correctAnswer =
        triviaData[currentQuestionIndex]['correctAnswer'] as String;
    setState(() {
      isAnsweredCorrectly = selectedAnswer == correctAnswer;
      if (isAnsweredCorrectly!) {
        correctAnswersCount++;
        _showCongratulations(); // Muestra felicitación
        _nextQuestion();
      } else {
        incorrectAttempts++;
        if (incorrectAttempts >= maxIncorrectAttempts) {
          _showResultsAndNavigateBack();
        } else {
          _showTryAgain(); // Muestra el mensaje de intentar nuevamente
        }
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < triviaData.length - 1) {
        currentQuestionIndex++;
        isAnsweredCorrectly = null;
        incorrectAttempts = 0;
      } else {
        // Muestra resultados y regresa a la pantalla principal
        _showResultsAndNavigateBack();
      }
    });
  }

  Future<void> _showResultsAndNavigateBack() async {
    String message = ''; // Inicializar la variable message

    return showDialog(
      context: context,
      barrierDismissible:
          false, // No permitir cerrar al tocar fuera del diálogo
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.pop(context); // Cierra el diálogo al tocar fuera de él
          if (incorrectAttempts > 0) {
            Navigator.pop(
              context,
            ); // Regresa a la pantalla principal solo si hay intentos incorrectos
          }
        },
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Resultados',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Respuestas correctas: $correctAnswersCount',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                if (incorrectAttempts > 0)
                  Text(
                    'Perdiste $incorrectAttempts vidas. ¿Quieres intentarlo de nuevo?',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el diálogo
                    if (incorrectAttempts > 0) {
                      Navigator.pop(
                          context); // Regresa a la pantalla principal solo si hay intentos incorrectos
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.black),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('OK'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _shareResult(); // Método para compartir el resultado
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.white),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('Compartir en redes sociales'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _shareResult() {
    String message =
        '¡Obtuve $correctAnswersCount respuestas correctas en la trivia!\n\n';

    message += 'Preguntas interesantes:\n';
    for (int i = 0; i < triviaData.length; i++) {
      message +=
          '${i + 1}. ${triviaData[i]['question']} - Respuesta correcta: ${triviaData[i]['correctAnswer']}\n';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Compartir Resultado'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('¿Estás seguro de que quieres compartir estos resultados?'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _performShare(message);
            },
            child: const Text('Compartir'),
          ),
        ],
      ),
    );
  }

  void _performShare(String message) {
    Share.share(message, subject: 'Resultado de la Trivia Educativa');
  }
}
