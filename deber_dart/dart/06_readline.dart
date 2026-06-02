import 'dart:io';

void main() {
  print('Ingrese el nombre del cliente:');
  String? cliente = stdin.readLineSync();
  print('Cliente: $cliente');

  print('Ingrese los días de alquiler:');
  int dias = int.parse(stdin.readLineSync()!);
  print('Días de alquiler: $dias');

  print('Ingrese la tarifa diaria:');
  double tarifa = double.parse(stdin.readLineSync()!);
  print('Tarifa diaria: \$${tarifa.toStringAsFixed(2)}');

  print('Ingrese el costo del seguro:');
  double seguro = double.parse(stdin.readLineSync()!);

  print('Ingrese el costo adicional:');
  double adicional = double.parse(stdin.readLineSync()!);

  print('Suma de cargos: ${seguro + adicional}');
  print('Diferencia de cargos: ${seguro - adicional}');
  print('Multiplicación de cargos: ${seguro * adicional}');
  print('División de cargos: ${seguro / adicional}');

  double total = dias * tarifa;

  print('Total del alquiler: \$${total.toStringAsFixed(2)}');

  if (total >= 200) {
    print('Aplica para descuento especial');
  } else {
    print('No aplica para descuento');
  }
}