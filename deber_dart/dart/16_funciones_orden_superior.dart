void main() {
  final tarifas = [45.0, 60.0, 35.0, 80.0];

  final tarifasConSeguro = tarifas.map((t) => t + 10);
  print(tarifasConSeguro.toList());

  final vehiculos = [
    'Toyota Corolla',
    'Kia Rio',
    'Mazda 3'
  ];

  final codigos = vehiculos.map((v) => 'VEH-$v');
  print(codigos.toList());
}