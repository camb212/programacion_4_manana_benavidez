void main() {
  int vehiculosDisponibles = 12;
  int alquileres = 0;

  while (vehiculosDisponibles > 0) {
    alquileres++;
    vehiculosDisponibles--;

    print(
      'Alquiler #$alquileres realizado (vehículos restantes: $vehiculosDisponibles)',
    );
  }

  int intentosPago = 0;
  bool pagoConfirmado = false;

  do {
    intentosPago++;
    print('Verificando pago #$intentosPago...');

    if (intentosPago == 3) {
      pagoConfirmado = true;
    }
  } while (!pagoConfirmado && intentosPago < 5);

  print(
    pagoConfirmado
        ? 'Pago confirmado después de $intentosPago intentos'
        : 'No se pudo confirmar el pago',
  );
}