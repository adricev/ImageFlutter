import 'package:flutter/material.dart';
import 'order_img.dart';

class RandomImgOrder extends StatefulWidget {
  final String nombre;

  const RandomImgOrder({Key? key, required this.nombre}) : super(key: key);

  @override
  _RandomImgOrderState createState() => _RandomImgOrderState();
}

class _RandomImgOrderState extends State<RandomImgOrder> {
  List<String> imagenes = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg'
  ];
  List<String> secuencia = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    generarSecuencia();
  }

  void generarSecuencia() {
    setState(() {
      secuencia = imagenes.toList(); // Copia las imágenes para la secuencia
      secuencia.shuffle(); // Mezcla la secuencia
      mostrarSiguienteImagen();
    });
  }

  void mostrarSiguienteImagen() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        currentIndex++;
        if (currentIndex < secuencia.length) {
          mostrarSiguienteImagen();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ImgListOrder(
                nombre: widget.nombre,
                secuencia: imagenes,
                imagenesFijas: const [],
              ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300], // Cambiar el color de fondo a rojo vino
      appBar: AppBar(
        title: const Text('Orden Aleatorio de Imágenes'),
        backgroundColor:
            Colors.red[700], // Cambiar el color de la barra de navegación
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Imagen ${currentIndex + 1} de 4', // Agregar contador de imágenes
              style: TextStyle(
                color: Colors.white, // Color de texto blanco
                fontSize: 18, // Tamaño de fuente
              ),
            ),
            const SizedBox(height: 20),
            currentIndex < secuencia.length
                ? SizedBox(
                    width: 200, // Reducir el tamaño de la imagen
                    height: 200,
                    child: Image.asset(
                      secuencia[currentIndex],
                      fit: BoxFit
                          .cover, // Ajusta la imagen al tamaño especificado
                    ),
                  )
                : CircularProgressIndicator(
                    // Cambiar el color del indicador de progreso
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
          ],
        ),
      ),
    );
  }
}
