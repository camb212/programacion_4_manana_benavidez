void main() {
  final cliente = 'Carlos';
  final diasAlquiler = 5;

  print('Bienvenido, $cliente');

  print(
    '${cliente.toUpperCase()} tiene una reserva por ${diasAlquiler + 1} días'
  );

  final contrato = '''
Cliente: $cliente
Días de alquiler: $diasAlquiler
Estado: ${diasAlquiler > 0 ? 'Activo' : 'Sin reserva'}
  ''';

  print(contrato);

  final rutaContrato = r'C:\Contratos\RentaVehiculos\Contrato001.pdf';
  print(rutaContrato);

  final mensaje = 'Cliente: ' + cliente + ' registrado correctamente';

  print(mensaje);

  print('toyota corolla'.toUpperCase());
  print('  Chevrolet Spark  '.trim());
  print('Toyota Corolla'.contains('Cor'));
  print('Toyota Corolla'.replaceAll('o', 'O'));
  print('Toyota,Chevrolet,Kia'.split(','));
  print('Hyundai Accent'.substring(0, 7));
  print('Mazda 3'.startsWith('Maz'));
  print('SUV'.padLeft(6, '0'));
  print('SUV'.padRight(6, '0'));
}