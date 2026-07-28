import 'package:flutter/material.dart';
import 'package:modulo06_widgets_mp/widgets/catalogo_basicos_mp.dart';
import 'package:modulo06_widgets_mp/widgets/contador_limitado_mp.dart';
import 'package:modulo06_widgets_mp/widgets/etiqueta_mp.dart';
import 'package:modulo06_widgets_mp/widgets/pantalla_contexto_mp.dart';
import 'package:modulo06_widgets_mp/widgets/reloj_mp.dart';
import 'package:modulo06_widgets_mp/widgets/servicio_estado_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                         │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                       │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 8;
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.blueAccent,          
      brightness: Brightness.light,    
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Disponible',    color: Colors.green, icono: Icons.check_circle_outline),
            Etiqueta(texto: 'En Taller',     color: Colors.red,    relleno: true, icono: Icons.build),
            Etiqueta(texto: 'Reservado',     color: Colors.orange, icono: Icons.calendar_month),
            Etiqueta(texto: 'Premium',       color: Colors.purple, fontSize: 16, relleno: true, icono: Icons.star),
            Etiqueta(texto: 'Económico',     color: Colors.blue,   fontSize: 11, icono: Icons.savings),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'Ford Explorer 2024'),
      ),
    ),
    5 => Scaffold(                               // Paso 3b
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Días de Alquiler',
              limite:   15,
              color:    Colors.blueAccent,
              textoBoton: 'Añadir Día',
              onLimite: () => debugPrint('¡Límite máximo de días de renta alcanzado!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Conductores Adicionales',
              limite:   3,
              color:    Colors.indigo, 
              textoBoton: 'Añadir Conductor',
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                            
      appBar: AppBar(title: const Text('Temporizador de Prueba de Manejo')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),  
    _ => const Scaffold(body: Center(child: Text('Paso no definido. Intenta del 1 al 7.'))),
  },
  
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    // describe cómo se ve
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: SelectableText(
        'Bienvenido al portal de Rent-A-Car. Nuestra nueva flota de vehículos SUV e híbridos ya está lista para tus próximos viajes. Garantizamos reservas rápidas, vehículos impecables y el mejor servicio en carretera.',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: Colors.blueAccent,
          shadows: [
            Shadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
          ]
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}