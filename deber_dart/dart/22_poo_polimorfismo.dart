abstract class Vehiculo {
  String get modelo;
  double calcularCosto(int dias);
}

class Sedan extends Vehiculo {
  final double tarifaDiaria;

  Sedan(this.tarifaDiaria);

  @override
  String get modelo => 'Sedán';

  @override
  double calcularCosto(int dias) => tarifaDiaria * dias;
}

class Suv extends Vehiculo {
  final double tarifaDiaria;

  Suv(this.tarifaDiaria);

  @override
  String get modelo => 'SUV';

  @override
  double calcularCosto(int dias) => tarifaDiaria * dias;
}

class Camioneta extends Vehiculo {
  final double tarifaDiaria;

  Camioneta(this.tarifaDiaria);

  @override
  String get modelo => 'Camioneta';

  @override
  double calcularCosto(int dias) => tarifaDiaria * dias;
}

void imprimirCosto(Vehiculo vehiculo, int dias) {
  print(
    '${vehiculo.modelo}: \$${vehiculo.calcularCosto(dias).toStringAsFixed(2)}',
  );
}

void main() {
  final vehiculos = <Vehiculo>[
    Sedan(45),
    Suv(70),
    Camioneta(90),
  ];

  for (final v in vehiculos) {
    imprimirCosto(v, 5);
  }

  final masCostoso = vehiculos.reduce(
    (a, b) =>
        a.calcularCosto(5) > b.calcularCosto(5)
            ? a
            : b,
  );

  print('\nVehículo más costoso: ${masCostoso.modelo}');
}