// lib/models/metrica_auto_modelo.dart
class MetricaAuto {
  final String auto;
  final double velocidadPromedio;
  final double pasajeros;
  final int viajesRealizados;
  final double combustible;

  const MetricaAuto({
    required this.auto,
    required this.velocidadPromedio,
    required this.pasajeros,
    required this.viajesRealizados,
    required this.combustible,
  });
}