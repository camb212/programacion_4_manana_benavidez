// lib/screens/pantalla_autos.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/auto_modelo.dart';

class PantallaAutos extends StatelessWidget {
  const PantallaAutos({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final autos = autosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Autos Disponibles'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: ListView.builder(
        itemCount:   autos.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.directions_car),
          title:   Text(autos[i].marcaModelo),
          subtitle: Text('Placa: ${autos[i].placa} | \$${autos[i].precioPorDia.toStringAsFixed(2)}/día'),
          onTap: () {
            context.push('/autos/${autos[i].id}', extra: autos[i]);
          },
        ),
      ),
    );
  }
}