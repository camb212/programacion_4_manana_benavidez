// lib/models/auto_modelo.dart
class AutoAlquiler {
  final String id;
  final String marcaModelo;
  final String placa;
  final double precioPorDia;
  final bool aireAcondicionado;

  const AutoAlquiler({
    required this.id,
    required this.marcaModelo,
    required this.placa,
    required this.precioPorDia,
    required this.aireAcondicionado,
  });
}

// Lista simulada — en una app real vendría de un provider
const autosSimulados = [
  AutoAlquiler(id: '1', marcaModelo: 'Toyota Corolla 2024', placa: 'AB-123-CD', precioPorDia: 45.0, aireAcondicionado: true),
  AutoAlquiler(id: '2', marcaModelo: 'Jeep Renegade', placa: 'EF-456-GH', precioPorDia: 75.0, aireAcondicionado: true),
  AutoAlquiler(id: '3', marcaModelo: 'Renault Kwid', placa: 'IJ-789-KL', precioPorDia: 25.0, aireAcondicionado: false),
];