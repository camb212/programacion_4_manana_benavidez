fun main() {
    val cliente = "Ana"
    val edad: Int = 22 
    val precioPorDia = 35.50
    
    // mutable
    var diasAlquiler = 0
    
    diasAlquiler = diasAlquiler + 1
    println("Días de alquiler: $diasAlquiler")
    
    diasAlquiler = diasAlquiler - 1
    println("Días de alquiler: $diasAlquiler")
    
    println("$cliente tiene $edad años")
    println("Precio por día: $$precioPorDia")
}