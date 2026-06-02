class Vehiculo {
  final String placa;
  final String modelo;
  final double tarifaDiaria;
  final bool disponible;

  Vehiculo({
    required this.placa,
    required this.modelo,
    required this.tarifaDiaria,
    this.disponible = true,
  });

  Vehiculo.economico()
      : placa = 'ECO-001',
        modelo = 'Chevrolet Spark',
        tarifaDiaria = 35.0,
        disponible = true;

  Vehiculo.premium({
    required this.placa,
    required this.modelo,
  }) : tarifaDiaria = 80.0,
       disponible = true;

  factory Vehiculo.desdeTexto(String datos) {
    final partes = datos.split(',');

    return Vehiculo(
      placa: partes[0],
      modelo: partes[1],
      tarifaDiaria: double.parse(partes[2]),
    );
  }

  @override
  String toString() =>
      '$modelo - $placa - \$${tarifaDiaria.toStringAsFixed(2)} por día';
}

void main() {
  final v1 = Vehiculo(
    placa: 'ABC-123',
    modelo: 'Toyota Corolla',
    tarifaDiaria: 45.0,
  );

  final v2 = Vehiculo.economico();

  final v3 = Vehiculo.premium(
    placa: 'XYZ-789',
    modelo: 'BMW X5',
  );

  final v4 = Vehiculo.desdeTexto(
    'DEF-456,Kia Rio,40.0',
  );

  print(v1);
  print(v2);
  print(v3);
  print(v4);
}