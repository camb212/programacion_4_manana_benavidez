fun main() {
    val cliente = "Peter"
    val apellido = "Park"
    val edad = 28
    
    // variable simple
    println("Hola $cliente")
    
    // expresión
    println("Cliente: ${cliente.uppercase()} ${apellido.uppercase()}")
    
    val nombreCompleto = "Cliente: ${cliente.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)
    
    println("Edad: $edad años")
    
    // datos de alquiler
    val diasAlquiler = 5
    val precioPorDia = 40
    val total = diasAlquiler * precioPorDia
    
    val tarjeta = """
       |----- RENTAL CAR -----
       |Cliente: $cliente $apellido
       |Edad: $edad
       |Acceso: ${if(edad >= 21) "Permitido" else "Denegado"}
       |Días de alquiler: $diasAlquiler
       |Precio por día: $$precioPorDia
       |Total a pagar: $$total
   """.trimMargin()
   
   println(tarjeta)
}


