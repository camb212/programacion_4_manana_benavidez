void main() {
  final costoTotal = (double tarifa, int dias) => tarifa * dias;
  print(costoTotal(45.0, 7));

  final calcularPagoFinal = (
    double total,
    double descuento,
  ) {
    final valorDescuento = total * (descuento / 100);
    return total - valorDescuento;
  };

  print(calcularPagoFinal(315.0, 10.0));

  final vehiculos = [
    'Toyota Corolla',
    'Kia Rio',
    'Mazda 3',
    'Chevrolet Spark',
    'Hyundai Accent'
  ];

  vehiculos.sort((a, b) => b.compareTo(a));

  print(vehiculos);
}