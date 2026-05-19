import 'dart:io';

void main() {

  print('Ingrese su nombre:');
  String? nombre = stdin.readLineSync();
  print('Hola $nombre');

  print('Ingrese su numero entero:');
  int numero = int.parse(stdin.readLineSync()!);
  print('Numero: $numero');

  print('Ingrese su decimal:');
  double valor = double.parse(stdin.readLineSync()!);
  print('Valor: $valor');

  print('Ingrese el primer número:');
  double num1 = double.parse(stdin.readLineSync()!);

  print('Ingrese el segundo número:');
  double num2 = double.parse(stdin.readLineSync()!);

  print('Suma: ${num1 + num2}');
  print('Resta: ${num1 - num2}');
  print('Multiplicación: ${num1 * num2}');
  print('División: ${num1 / num2}');


  print('Ingrese la calificacion:');
  double numero1 = double.parse(stdin.readLineSync()!);
  if (numero1 >= 7){
    print('aprobado');
  }else{
    print('reprobado');

  }
  
}