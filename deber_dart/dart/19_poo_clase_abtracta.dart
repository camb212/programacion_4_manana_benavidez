abstract class Vehiculo {
  String get modelo;
  double calcularCosto(int dias);
  int capacidadPasajeros();

  void describir(int dias) {
    print(
      '$modelo - Costo: \$${calcularCosto(dias).toStringAsFixed(2)}, '
      'Capacidad: ${capacidadPasajeros()} pasajeros',
    );
  }
}

class Sedan extends Vehiculo {
  final double tarifaDiaria;

  Sedan(this.tarifaDiaria);

  @override
  String get modelo => 'Sedán';

  @override
  double calcularCosto(int dias) => tarifaDiaria * dias;

  @override
  int capacidadPasajeros() => 5;
}

class Suv extends Vehiculo {
  final double tarifaDiaria;

  Suv(this.tarifaDiaria);

  @override
  String get modelo => 'SUV';

  @override
  double calcularCosto(int dias) => tarifaDiaria * dias;

  @override
  int capacidadPasajeros() => 7;
}

void main() {
  final vehiculos = <Vehiculo>[
    Sedan(45.0),
    Suv(70.0),
  ];

  for (final v in vehiculos) {
    v.describir(5);
  }
}