void main() {
  String cliente = 'Carlos';

  String? licenciaConducir = null;
  licenciaConducir = 'EC123456';

  String? vehiculoAsignado;

  print(vehiculoAsignado?.length);

  String vehiculoDisponible = vehiculoAsignado ?? 'No asignado';
  print(vehiculoDisponible);

  if (vehiculoAsignado != null) {
    String vehiculoSeguro = vehiculoAsignado;
    print(vehiculoSeguro);
  } else {
    print('No hay vehículo asignado');
  }

  if (licenciaConducir != null) {
    print(licenciaConducir.length);
  }

  late String contrato;
  contrato = 'CTR-2026-001';
  print(contrato);
}