// lib/models/auto_modelo.dart
class AutoAlquiler {
  final String id;
  final String marca;
  final String modelo;
  final String patente;      // Reemplaza a 'ruta' o identificación de la ruta
  final int capacidadPasajeros; // Reemplaza a 'capacidad'
  final String transmision;  // Ej. Automática / Manual (reemplaza a 'conductor')
  final double precioPorDia; // Atributo clave para alquiler
  final bool aireAcondicionado; // Reemplaza a 'clima'
  bool favorito;             // Mutable — puede cambiar sin recrear el objeto

  AutoAlquiler({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.patente,
    required this.capacidadPasajeros,
    required this.transmision,
    required this.precioPorDia,
    required this.aireAcondicionado,
    this.favorito = false,
  });
}

class CategoriaAuto {
  final String id;
  final String nombreCategoria; // Ej. SUV, Sedán, Compacto, Pickup
  final String descripcion;
  final int capacidadPasajeros;
  final double tarifaBase;
  bool favorito;                // Mutable — puede cambiar sin recrear el objeto

  CategoriaAuto({
    required this.id,
    required this.nombreCategoria,
    required this.descripcion,
    required this.capacidadPasajeros,
    required this.tarifaBase,
    this.favorito = false,
  });
}