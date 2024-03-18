import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'points.dart';

class PuntuacionesGuardadasScreen extends StatefulWidget {
  const PuntuacionesGuardadasScreen({Key? key}) : super(key: key);

  @override
  _PuntuacionesGuardadasScreenState createState() =>
      _PuntuacionesGuardadasScreenState();
}

class _PuntuacionesGuardadasScreenState
    extends State<PuntuacionesGuardadasScreen> {
  List<Puntuacion> puntuacionesGuardadas = [];
  late SupabaseClient client;

  @override
  void initState() {
    super.initState();
    client = SupabaseClient('https://ncbqxdgcvkdgrdbfdmxw.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jYnF4ZGdjdmtkZ3JkYmZkbXh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMTc1NDEsImV4cCI6MjAxMTg5MzU0MX0.zWGkhRrXm7XKRnJeo6eU-uLm4DCNy4VeTe38W6MYx30');
    _cargarPuntuacionesGuardadas();
  }

  Future<void> _cargarPuntuacionesGuardadas() async {
    final response = await client
        .from('usuarios')
        .select()
        .order('puntos', ascending: false)
        .limit(10);

    final List<dynamic> data = response;
    List<Puntuacion> puntuaciones = data
        .map((item) => Puntuacion(
              nombre: item['nombre'] as String,
              puntaje: item['puntos'] as int,
            ))
        .toList();

    setState(() {
      puntuacionesGuardadas = puntuaciones;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 de las mejores puntuaciones'),
        backgroundColor: Colors.red[700], // Color de la barra de navegación
      ),
      body: ListView.builder(
        itemCount: puntuacionesGuardadas.length,
        itemBuilder: (context, index) {
          final puntuacion = puntuacionesGuardadas[index];
          final nombre = puntuacion.nombre;
          final puntaje = puntuacion.puntaje;

          return Card(
            elevation: 4,
            color: Colors.red[200], // Color del fondo del Card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white, // Color del texto del nombre
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Puntuación: $puntaje',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white, // Color del texto del puntaje
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
