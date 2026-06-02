fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Condicional If")

    val edadCliente = readLine()?.toIntOrNull() ?: 18

    if (edadCliente >= 21) {
        println("Cliente apto para alquilar vehículo")
    }
    if (edadCliente < 21) {
        println("Cliente no cumple la edad mínima para alquilar")
    }

    println("Edad registrada: $edadCliente años")
}