class Vehiculo {
  final String modelo;
  final int anio;

  Vehiculo(this.modelo, this.anio);

  String tipoVehiculo() => 'Vehículo';

  void mostrarInfo() {
    print(
      'Modelo: $modelo, Año: $anio, Tipo: ${tipoVehiculo()}',
    );
  }
}

class Sedan extends Vehiculo {
  Sedan(super.modelo, super.anio);

  @override
  String tipoVehiculo() => 'Sedán';

  void activarAire() {
    print('$modelo activa el aire acondicionado ❄️');
  }
}

class Suv extends Vehiculo {
  Suv(super.modelo, super.anio);

  @override
  String tipoVehiculo() => 'SUV';

  void activarTraccion4x4() {
    print('$modelo activa la tracción 4x4 🚙');
  }
}

void main() {
  final sedan = Sedan('Toyota Corolla', 2024);
  final suv = Suv('Toyota Fortuner', 2025);

  sedan.mostrarInfo();
  suv.mostrarInfo();

  sedan.activarAire();
  suv.activarTraccion4x4();
}