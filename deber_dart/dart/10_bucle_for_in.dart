void main() {
  final vehiculos = [
    'Toyota Corolla',
    'Chevrolet Spark',
    'Kia Rio',
    'Hyundai Accent',
    'Mazda 3'
  ];

  for (final vehiculo in vehiculos) {
    print(vehiculo);
  }

  vehiculos.forEach((v) => print(v.toUpperCase()));

  final tarifas = {
    'Toyota Corolla': 45,
    'Chevrolet Spark': 35,
    'Kia Rio': 40,
    'Hyundai Accent': 42
  };

  for (final entrada in tarifas.entries) {
    print('${entrada.key} → \$${entrada.value} por día');
  }
}