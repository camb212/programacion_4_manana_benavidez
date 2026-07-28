// lib/models/auto_modelo.dart
class AutoAlquiler {
  final String id;
  final String marcaModelo;
  final String placa;
  final int capacidadPasajeros;
  final bool aireAcondicionado;
  bool favorito;

  AutoAlquiler({
    required this.id,
    required this.marcaModelo,
    required this.placa,
    required this.capacidadPasajeros,
    required this.aireAcondicionado,
    this.favorito = false,
  });
}