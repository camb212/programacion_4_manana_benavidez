
fun main() {
    
    println("=== Sistema de Alquiler de Autos ===")
    
    println("Escribe tu nombre:")
    val nombre = readLine() ?: "Cliente"
    
    println("Escribe tu apellido:")
    val apellido = readLine() ?: "Anonimo"
    
    println("¿Cuántos días deseas alquilar el auto?")
    val diasInput = readLine()
    val dias = diasInput?.toIntOrNull() ?: 0
    
    val precioPorDia = 40
    val total = dias * precioPorDia
    
    println("\n--- Resumen de Alquiler ---")
    println("Cliente: $nombre $apellido")
    println("Días de alquiler: $dias")
    println("Precio por día: $$precioPorDia")
    println("Total a pagar: $$total")
}