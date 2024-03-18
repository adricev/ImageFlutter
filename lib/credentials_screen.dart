import 'package:flutter/material.dart';
import 'show_images_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NombreScreenState createState() => _NombreScreenState();
}

class _NombreScreenState extends State<NameScreen> {
  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 2, 2, 3), // Cambiar el color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Juego de Memoria',
              style: TextStyle(
                fontSize: 36, // Cambiar el tamaño del texto
                color: Colors.white, // Cambiar el color del texto
                fontWeight: FontWeight.bold, // Añadir negrita al texto
                fontFamily: 'Arial', // Cambiar la fuente del texto
              ),
            ),
            SizedBox(height: 50), // Aumentar el espacio vertical
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nombreController,
                style: TextStyle(color: Colors.white), // Cambiar color de texto
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                      color:
                          Colors.white), // Cambiar color de texto de etiqueta
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Cambiar color del borde
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Cambiar color del borde cuando enfocado
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nombre = _nombreController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowImagesScreen(nombre: nombre),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber, // Cambiar el color del botón
                padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40), // Ajustar el tamaño del botón
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(25), // Añadir bordes redondeados
                ),
              ),
              child: Text(
                'Aceptar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Cambiar el tamaño del texto del botón
                  fontWeight:
                      FontWeight.bold, // Añadir negrita al texto del botón
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
