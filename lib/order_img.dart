import 'package:flutter/material.dart';

class ImgListOrder extends StatefulWidget {
  final String nombre;
  final List<String> secuencia;

  const ImgListOrder({
    Key? key,
    required this.nombre,
    required this.secuencia,
    required List imagenesFijas,
  }) : super(key: key);

  @override
  _RandomImgOrderScreenState createState() => _RandomImgOrderScreenState();
}

class _RandomImgOrderScreenState extends State<ImgListOrder> {
  late List<int?> posiciones;

  @override
  void initState() {
    super.initState();
    posiciones = List.filled(widget.secuencia.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300], // Fondo rojo vino
      appBar: AppBar(
        title: const Text('Orden Aleatorio de Imágenes'),
        backgroundColor: Colors.red[700], // Barra de navegación rojo vino
        automaticallyImplyLeading: false, // Eliminar la opción de retroceder
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Escribe en qué orden ha salido cada una:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Texto en color blanco
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  Column(
                    children: List.generate(
                      (widget.secuencia.length / 2).ceil(),
                      (index) => SizedBox(
                        width: 100,
                        height: 160,
                        child: Column(
                          children: [
                            Image.asset(
                              widget.secuencia[index],
                              width: 80, // Imágenes más pequeñas
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 80,
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    posiciones[index] = int.tryParse(value);
                                  });
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: '${index + 1}',
                                  labelStyle: TextStyle(
                                    color: Colors
                                        .white, // Color del texto de etiqueta
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      (widget.secuencia.length / 2).floor(),
                      (index) => SizedBox(
                        width: 100,
                        height: 160,
                        child: Column(
                          children: [
                            Image.asset(
                              widget.secuencia[
                                  index + (widget.secuencia.length / 2).ceil()],
                              width: 80, // Imágenes más pequeñas
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 80,
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    posiciones[index +
                                        (widget.secuencia.length / 2)
                                            .ceil()] = int.tryParse(value);
                                  });
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText:
                                      '${index + (widget.secuencia.length / 2).ceil() + 1}',
                                  labelStyle: TextStyle(
                                    color: Colors
                                        .white, // Color del texto de etiqueta
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para verificar el orden de las imágenes si lo deseas
                  // Y puedes navegar a la pantalla de puntuación si lo consideras necesario
                  // Por el momento, dejé este botón sin funcionalidad
                },
                child: const Text(
                  'Ver Puntuación',
                  style: TextStyle(
                    color: Colors.white, // Color del texto del botón
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[700], // Color del botón rojo vino
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
