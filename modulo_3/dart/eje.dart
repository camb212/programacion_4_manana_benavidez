import 'dart:io';

void main() {
  int cajas = 1;
  int totalCajas = 0;
  int empleados = 0;

  while (cajas > 0) {
    stdout.write('Ingrese la cantidad de cajas empacadas: ');
    cajas = int.parse(stdin.readLineSync()!);

    if (cajas > 0) {
      empleados++;
      totalCajas += cajas;

      if (cajas < 20) {
        print('Rendimiento bajo');
      } else if (cajas >= 20 && cajas <= 50) {
        print('Rendimiento normal');
      } else {
        print('Rendimiento excelente');
      }
    }
  }

  double promedio = 0;

  if (empleados > 0) {
    promedio = totalCajas / empleados;
  }

  print('\n--- RESULTADOS ---');
  print('Total de cajas empacadas: $totalCajas');
  print('Cantidad de empleados registrados: $empleados');
  print('Promedio de cajas por empleado: $promedio');
}