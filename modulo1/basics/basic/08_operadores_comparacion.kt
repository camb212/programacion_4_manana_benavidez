fun main() {
  println("Operadores de logicos")
  
  val numero1=15
  val numero2= 10
  val esMayor=true
  val tienePermiso=false
  val estaActivo=true
  println("&& - And Logicos")
  println("$esMayor && $tienePermiso=${es Mayor && tienePermiso}")
  println("$estaActivo && $esMayor=${estaActivo && esMayor}")
  println("|| -Or Logico")
  println("$esMAYO$numero2=${numero1>numero2}")
  println("$numero1>=$numero2=${numero1>=numero2}")
  println("$numero1<$numero2=${numero1<numero2}")
  println("$numero1<=$numero2=${numero1<=numero2}")
  
}