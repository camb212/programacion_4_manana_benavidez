// TODO Implement this library.
// lib/screens/pantalla_metricas_autos.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_auto_modelo.dart';
import '../providers/metricas_autos_provider.dart';

class PantallaMetricasAutos extends ConsumerWidget {
  const PantallaMetricasAutos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricasAsync = ref.watch(metricasAutosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado de la flota de autos'),
        actions: [
          IconButton(
            icon:    const Icon(Icons.refresh),
            tooltip: 'Recargar',
            onPressed: () =>
                ref.read(metricasAutosProvider.notifier).recargar(),
          ),
        ],
      ),
      body: metricasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $e'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(metricasAutosProvider.notifier).recargar(),
                icon:  const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (metricas) => ListView.builder(
          padding:     const EdgeInsets.all(12),
          itemCount:   metricas.length,
          itemBuilder: (_, i) => _TarjetaMetricaAuto(metrica: metricas[i]),
        ),
      ),
    );
  }
}

class _TarjetaMetricaAuto extends StatelessWidget {
  final MetricaAuto metrica;
  const _TarjetaMetricaAuto({required this.metrica});

  @override
  Widget build(BuildContext context) {
    final cs          = Theme.of(context).colorScheme;
    final velCritica  = metrica.velocidadPromedio > 85;
    final pasCritica  = metrica.pasajeros > 90;
    final combCritica = metrica.combustible > 90; 
    final esCritico   = velCritica || pasCritica || combCritica;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color:  esCritico ? cs.errorContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.directions_car, color: esCritico ? cs.error : cs.primary, size: 18),
                const SizedBox(width: 8),
                Text(
                  metrica.auto,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${metrica.viajesRealizados} viajes',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Combustible: ${metrica.combustible.toStringAsFixed(0)} L',
              style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 10),
            _Barra('Velocidad', metrica.velocidadPromedio, velCritica),
            const SizedBox(height: 4),
            _Barra('Pasajeros', metrica.pasajeros, pasCritica),
            const SizedBox(height: 4),
            _Barra('Combustible', metrica.combustible, combCritica),
          ],
        ),
      ),
    );
  }
}

class _Barra extends StatelessWidget {
  final String label;
  final double valor;
  final bool   critica;
  const _Barra(this.label, this.valor, this.critica);

  @override
  Widget build(BuildContext context) {
    final color = critica ? Colors.red : Colors.green;
    return Row(children: [
      SizedBox(width: 75, child: Text(label,
          style: const TextStyle(fontSize: 12))),
      Expanded(
        child: LinearProgressIndicator(
          value:               valor / 100,
          backgroundColor: Colors.grey.shade200,
          valueColor:      AlwaysStoppedAnimation(color),
        ),
      ),
      const SizedBox(width: 8),
      Text('${valor.toStringAsFixed(1)}%',
          style: TextStyle(fontSize: 12, color: color,
              fontWeight: FontWeight.w600)),
    ]);
  }
}