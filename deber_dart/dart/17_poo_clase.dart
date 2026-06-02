class Vehiculo {
  final String placa;
  final String modelo;
  double tarifaDiaria;
  bool _disponible = true;

  Vehiculo({
    required this.placa,
    required this.modelo,
    required this.tarifaDiaria,
  });

  bool get disponible => _disponible;

  String get estado =>
      _disponible ? 'Disponible' : 'Alquilado';

  set cambiarDisponibilidad(bool valor) {
    _disponible = valor;
    print('$modelo: ${valor ? "Disponible" : "Alquilado"}');
  }

  void alquilar() {
    _disponible = false;
    print('$modelo alquilado');
  }

  void devolver() {
    _disponible = true;
    print('$modelo devuelto');
  }

  String resumen() =>
      'Placa: $placa | Modelo: $modelo | Tarifa: \$${tarifaDiaria.toStringAsFixed(2)} | Estado: $estado';

  @override
  String toString() =>
      'Vehiculo($modelo, $placa, $estado)';
}

void main() {
  final vehiculo = Vehiculo(
    placa: 'ABC-123',
    modelo: 'Toyota Corolla',
    tarifaDiaria: 45.0,
  );

  vehiculo.alquilar();

  print(vehiculo.estado);
  print(vehiculo.resumen());
  print(vehiculo);

  vehiculo.cambiarDisponibilidad = true;

  print(vehiculo.disponible);
}