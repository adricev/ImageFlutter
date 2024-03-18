import 'package:flutter/material.dart';

class RandomImgOrder extends StatefulWidget {
  final String nombre;

  const RandomImgOrder({Key? key, required this.nombre}) : super(key: key);

  @override
  _RandomImgOrderState createState() => _RandomImgOrderState();
}

class _RandomImgOrderState extends State<RandomImgOrder> {
  List<String> imagenes = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg'
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
              builder: (context) => RandomImgOrder(
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
      backgroundColor: Colors.lightBlue[100], // Cambiar el color de fondo
      appBar: AppBar(
        title: const Text('Orden Aleatorio de Imágenes'),
      ),
      body: Center(
        child: currentIndex < secuencia.length
            ? SizedBox(
                width: 400,
                height: 400,
                child: Image.asset(
                  secuencia[currentIndex],
                  fit: BoxFit.cover, // Ajusta la imagen al tamaño especificado
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
