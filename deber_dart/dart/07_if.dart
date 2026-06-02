void main() {
  int diasAlquiler = 8;

  if (diasAlquiler > 7) {
    print('Alquiler de larga duración');
  } else if (diasAlquiler > 0) {
    print('Alquiler estándar');
  } else {
    print('Sin alquiler registrado');
  }

  String estado =
      diasAlquiler > 7 ? 'Cliente frecuente' : 'Cliente ocasional';
  print(estado);

  String? vehiculo;

  String disponible =
      vehiculo != null ? vehiculo.toUpperCase() : 'Sin vehículo asignado';

  String disponible2 =
      vehiculo?.toUpperCase() ?? 'Sin vehículo asignado';

  print(disponible);
  print(disponible2);
}