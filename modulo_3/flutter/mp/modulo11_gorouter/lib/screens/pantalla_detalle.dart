// lib/screens/pantalla_detalle.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/auto_modelo.dart';

class PantallaDetalle extends StatelessWidget {
  final String        id;
  final AutoAlquiler? auto; // puede venir por extras

  const PantallaDetalle({super.key, required this.id, this.auto});

  @override
  Widget build(BuildContext context) {
    // Si no viene por extras, buscar en la lista simulada
    final vehiculo = auto ??
        autosSimulados.where((a) => a.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:              Text('Detalle: ${vehiculo?.marcaModelo ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: vehiculo == null
          ? Center(child: Text('Auto $id no encontrado'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('ID',       vehiculo.id),
                  _Fila('Modelo',   vehiculo.marcaModelo),
                  _Fila('Placa',    vehiculo.placa),
                  _Fila('Precio',   '\$${vehiculo.precioPorDia.toStringAsFixed(2)} / día'),
                  _Fila('A/C',      vehiculo.aireAcondicionado ? 'Sí' : 'No'),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/autos/${vehiculo.id}/logs'),
                      icon:  const Icon(Icons.list_alt),
                      label: const Text('Ver historial'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 70,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}