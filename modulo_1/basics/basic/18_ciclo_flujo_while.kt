// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
  println("Controles de flujo interaciones. ciclo repetitivos- ciclo while")
  println("While basico")
  var contador = 1
  while(contador <=5){
      println(contador)
      contador++;
  
  }
  println("Do While")
  contador=1
  do{
      println(contador)
      contador = 1
       
  while(contador <= 10){
      contador++;
      if(contador==3)continue
      if(contador==7)break
      println(contador)
  }
  
  var input: String
  while(true){
      println("Escribe'salir' para terminar: ")
      input=readLine()?:""
      if(input=="salir")break
      println("uted ingreso: $input ")
  }
  }
}