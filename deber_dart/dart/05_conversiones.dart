void main() {
  int diasAlquiler = 7;
  double costoBase = diasAlquiler.toDouble();
  String diasTexto = diasAlquiler.toString();

  int kilometros = int.parse('350');
  double tarifaDiaria = double.parse('45.50');

  int? multa = int.tryParse('abc');
  double? deposito = double.tryParse('200');

  Object vehiculo = 'Toyota Corolla';

  if (vehiculo is String) {
    print(vehiculo.length);
  }

  Object cliente = 'Carlos';
  String nombreCliente = cliente as String;

  String? placaVehiculo = null;
  int longitudPlaca = placaVehiculo?.length ?? 0;

  print(costoBase);
  print(diasTexto);
  print(kilometros);
  print(tarifaDiaria);
  print(multa);
  print(deposito);
  print(nombreCliente);
  print(longitudPlaca);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}