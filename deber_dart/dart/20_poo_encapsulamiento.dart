class Cliente {
  final String nombre;
  double _saldo;

  Cliente(this.nombre, double saldoInicial)
      : _saldo = saldoInicial;

  double get saldo => _saldo;

  void recargarSaldo(double monto) {
    if (monto <= 0) {
      throw ArgumentError('El monto debe ser positivo');
    }

    _saldo += monto;
    print('Recarga de \$${monto}. Nuevo saldo: \$${_saldo}');
  }

  void pagarAlquiler(double monto) {
    if (monto <= 0) {
      throw ArgumentError('El monto debe ser positivo');
    }

    if (monto > _saldo) {
      throw StateError('Saldo insuficiente');
    }

    _saldo -= monto;
    print('Pago de \$${monto}. Saldo restante: \$${_saldo}');
  }
}

void main() {
  final cliente = Cliente('Carlos Pérez', 500.0);

  cliente.recargarSaldo(200.0);
  cliente.pagarAlquiler(150.0);

  print(cliente.saldo);
}