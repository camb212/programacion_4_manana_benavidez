double aplicarDescuento(double total) => total * 0.90;
double aplicarRecargo(double total) => total * 1.15;

void main() {
  double Function(double) operacion;

  operacion = aplicarDescuento;
  print(operacion(200));

  operacion = aplicarRecargo;
  print(operacion(200));

  final calculos = <double Function(double)>[
    aplicarDescuento,
    aplicarRecargo,
  ];

  for (final fn in calculos) {
    print(fn(500));
  }
}