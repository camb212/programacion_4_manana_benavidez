fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Control de Flujo When con bloques")

    println("Edad del cliente:")
    val edadCliente = readLine()?.toIntOrNull() ?: 0

    println("¿Desea seguro? (s/n):")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"

    val tipoSeguro = if (tieneSeguro) {
        println("Tipo de seguro (BASICO/INTERMEDIO/PREMIUM):")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    val costoAdicional = when {
        !tieneSeguro && edadCliente < 21 -> 30.0
        !tieneSeguro && edadCliente >= 70 -> 25.0
        !tieneSeguro -> 15.0
        tipoSeguro == "BASICO" -> 20.0
        tipoSeguro == "INTERMEDIO" -> 10.0
        tipoSeguro == "PREMIUM" -> 0.0
        else -> 35.0
    }

    println("Costo adicional: $${"%.2f".format(costoAdicional)}")
}