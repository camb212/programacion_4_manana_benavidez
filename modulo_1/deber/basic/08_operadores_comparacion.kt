fun main() {
    println("=== Sistema de Alquiler de Autos ===")

    val edadCliente = 25
    val tieneLicencia = true
    val tieneTarjeta = false
    val autoDisponible = true

    println("\n--- Validación para alquilar ---")

    // Operador AND (&&)
    println("Condición: edad >= 21 && tiene licencia")
    println("$edadCliente >= 21 && $tieneLicencia = ${edadCliente >= 21 && tieneLicencia}")

    println("\nCondición: tiene licencia && tiene tarjeta")
    println("$tieneLicencia && $tieneTarjeta = ${tieneLicencia && tieneTarjeta}")

    // Operador OR (||)
    println("\n--- Alternativas ---")
    println("Condición: tiene tarjeta || auto disponible")
    println("$tieneTarjeta || $autoDisponible = ${tieneTarjeta || autoDisponible}")

    // Comparaciones
    println("\n--- Comparaciones ---")
    val diasSolicitados = 5
    val diasMaximos = 7

    println("$diasSolicitados > $diasMaximos = ${diasSolicitados > diasMaximos}")
    println("$diasSolicitados >= $diasMaximos = ${diasSolicitados >= diasMaximos}")
    println("$diasSolicitados < $diasMaximos = ${diasSolicitados < diasMaximos}")
    println("$diasSolicitados <= $diasMaximos = ${diasSolicitados <= diasMaximos}")
}