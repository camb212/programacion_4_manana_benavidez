double calcularTotal(double tarifa, int dias) {
  return tarifa * dias;
}

double calcularDescuento(double total) => total * 0.10;

void mostrarTitulo(String titulo) {
  print('─── $titulo ───');
}

String formatearValor(double valor) =>
    '\$${valor.toStringAsFixed(2)}';

formatearValorSimple(double valor) =>
    '\$${valor.toStringAsFixed(2)}';

void main() {
  String generarContrato(String cliente, String vehiculo, [int? dias]) {
    if (dias != null) {
      return 'Cliente: $cliente - Vehículo: $vehiculo - Días: $dias';
    }
    return 'Cliente: $cliente - Vehículo: $vehiculo';
  }

  String generarContratoV2(
    String cliente,
    String vehiculo, [
    int dias = 1,
  ]) {
    return 'Cliente: $cliente - Vehículo: $vehiculo - Días: $dias';
  }

  print(calcularTotal(45.0, 5));
  print(calcularDescuento(225.0));

  mostrarTitulo('Renta de Vehículos');

  print(formatearValor(150.5));
  print(formatearValorSimple(80));

  print(generarContrato('Carlos', 'Toyota Corolla'));
  print(generarContrato('Carlos', 'Toyota Corolla', 5));

  print(generarContratoV2('María', 'Kia Rio'));
}