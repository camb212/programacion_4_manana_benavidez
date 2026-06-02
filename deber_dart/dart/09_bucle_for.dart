void main() {
  for (int i = 1; i <= 5; i++) {
    print('Vehículo #$i disponible');
  }

  for (int dias = 1; dias <= 10; dias += 2) {
    print('Plan de alquiler por $dias días');
  }

  for (int puestos = 5; puestos >= 1; puestos--) {
    print('Quedan $puestos vehículos disponibles');
  }
}