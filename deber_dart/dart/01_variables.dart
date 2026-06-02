void main() {
  var cliente = 'Carlos';
  var diasAlquiler = 5;
  var tarifaDiaria = 45.50;
  var disponible = true;

  String vehiculo = 'Toyota Corolla';
  int kilometraje = 25000;
  double deposito = 200.00;
  bool seguroIncluido = true;

  final sucursal = 'Quito';

  const iva = 0.15;
  const descuento = 0.10;

  final fechaAlquiler = DateTime.now();

  print(
    '$cliente alquiló un $vehiculo por $diasAlquiler días en la sucursal de $sucursal'
  );
}