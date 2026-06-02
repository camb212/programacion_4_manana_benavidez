void main() {
  String estadoReserva = 'ACT';

  switch (estadoReserva) {
    case 'ACT':
      print('Reserva activa');
      break;
    case 'FIN':
      print('Alquiler finalizado');
      break;
    case 'CAN':
      print('Reserva cancelada');
      break;
    case 'PEN':
      print('Pago pendiente');
      break;
    default:
      print('Estado desconocido');
  }

  String descripcion = switch (estadoReserva) {
    'ACT' => 'Vehículo entregado al cliente',
    'FIN' => 'Contrato finalizado correctamente',
    'CAN' => 'Reserva cancelada por el cliente',
    'PEN' => 'Esperando confirmación de pago',
    _ => 'Estado no registrado',
  };

  print(descripcion);

  int diasAlquiler = 10;

  String categoria = switch (diasAlquiler) {
    1 || 2 || 3 => 'Alquiler corto',
    4 || 5 || 6 || 7 => 'Alquiler estándar',
    8 || 9 || 10 => 'Alquiler prolongado',
    _ => 'Plan especial',
  };

  print(categoria);

  double totalPagar = 450.0;

  String mensaje = switch (totalPagar) {
    double t when t >= 500 =>
      'Cliente VIP',
    double t when t >= 300 =>
      'Descuento disponible',
    double t when t >= 100 =>
      'Tarifa estándar',
    _ =>
      'Tarifa básica',
  };

  print(mensaje);

  Object informacion = {
    'cliente': 'Carlos',
    'vehiculo': 'Toyota Corolla',
    'total': 450.0
  };

  String resultado = switch (informacion) {
    Map<String, dynamic> m when m.containsKey('error') =>
      'Error: ${m['error']}',

    Map<String, dynamic> m =>
      'Cliente: ${m['cliente']} - Vehículo: ${m['vehiculo']} - Total: \$${m['total']}',

    List<dynamic> lista =>
      '${lista.length} vehículos registrados',

    String texto =>
      'Información: $texto',

    _ =>
      'Datos desconocidos',
  };

  print(resultado);
}