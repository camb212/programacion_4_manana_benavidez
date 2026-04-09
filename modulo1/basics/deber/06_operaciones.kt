fun main() {
  
  println("=== Sistema de Alquiler de Autos ===")
  
  val precioPorDia = 50
  val dias = 4
  
  println("Operaciones básicas")
  
  println("Costo base")
  println("$precioPorDia * $dias : ${precioPorDia * dias}")
  
  println("Descuento de $10")
  println("${precioPorDia * dias} - 10 : ${(precioPorDia * dias) - 10}")
  
  println("Recargo por seguro (+15)")
  println("${precioPorDia * dias} + 15 : ${(precioPorDia * dias) + 15}")
  
  println("Dividir pago en 2 cuotas")
  println("${precioPorDia * dias} / 2 : ${(precioPorDia * dias) / 2}")
  
  println("Operadores asignados compuestos")
  
  var total = precioPorDia * dias
  println("Total inicial: $total")
  
  total += 15
  println("Agregar seguro (+=15): $total")
  
  total -= 10
  println("Aplicar descuento (-=10): $total")
  
  total *= 2
  println("Duplicar costo (*=2): $total")
  
  total /= 2
  println("Dividir en partes (/=2): $total")
  
  total %= 7
  println("Módulo (%=7): $total")
  
  total++
  println("Incremento (++): $total")
  
  total--
  println("Decremento (--): $total")
}