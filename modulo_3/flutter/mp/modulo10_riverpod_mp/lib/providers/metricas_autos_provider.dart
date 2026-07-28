// lib/providers/metricas_autos_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_auto_modelo.dart';

class MetricasAutosNotifier extends AsyncNotifier<List<MetricaAuto>> {
  // build() puede ser async — es la carga inicial
  @override
  Future<List<MetricaAuto>> build() => _fetch();

  Future<List<MetricaAuto>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaAuto(auto: 'Toyota Corolla', velocidadPromedio: 45.2, pasajeros: 62.1, viajesRealizados: 230, combustible: 80),
      MetricaAuto(auto: 'Volkswagen Gol', velocidadPromedio: 88.1, pasajeros: 91.2, viajesRealizados: 80, combustible: 120),
      MetricaAuto(auto: 'Jeep Renegade', velocidadPromedio: 22.4, pasajeros: 41.0, viajesRealizados: 50, combustible: 60),
      MetricaAuto(auto: 'Renault Kwid', velocidadPromedio: 20.0, pasajeros: 12.0, viajesRealizados: 20, combustible: 40),
      MetricaAuto(auto: 'Chevrolet Cruze', velocidadPromedio: 5.0, pasajeros: 9.0, viajesRealizados: 5, combustible: 20),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasAutosProvider =
    AsyncNotifierProvider<MetricasAutosNotifier, List<MetricaAuto>>(
  MetricasAutosNotifier.new,
);