// lib/screens/pantalla_autos_filtrados.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/auto_modelo.dart';

class PantallaAutosFiltrados extends StatelessWidget {
  final bool soloAire;
  const PantallaAutosFiltrados({super.key, this.soloAire = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloAire
        ? autosSimulados.where((a) => a.aireAcondicionado).toList()
        : autosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Autos${soloAire ? ' (Con A/C)' : ''}'),
        actions: [
          // Toggle filtro A/C — cambia la URL con query param
          IconButton(
            icon:    Icon(soloAire ? Icons.ac_unit : Icons.eco),
            tooltip: soloAire ? 'Ver todos' : 'Solo con A/C',
            onPressed: () => soloAire
                ? context.go('/autos')
                : context.go('/autos?soloAire=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final a = filtrados[i];
          return ListTile(
            leading: Icon(Icons.directions_car, color: a.aireAcondicionado ? Colors.blue : Colors.grey),
            title:   Text(a.marcaModelo),
            subtitle: Text('Placa: ${a.placa} | \$${a.precioPorDia.toStringAsFixed(2)}/día'),
            onTap: () => context.push(
              '/autos/${a.id}',
              extra: a,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}