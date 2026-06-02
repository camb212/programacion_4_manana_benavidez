fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Control de Flujo When")

    println("Nombre del cliente:")
    val nombreCliente = readLine()?.trim() ?: "Sin identificación"

    println("Nivel de cliente (VIP/REGULAR/NUEVO):")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "VIP" -> {
            println("CLIENTE VIP: $nombreCliente")
            println("Atención prioritaria")
            println("Descuento especial aplicado")
        }
        "REGULAR" -> {
            println("CLIENTE REGULAR: $nombreCliente")
            println("Atención estándar")
            println("Beneficios básicos")
        }
        "NUEVO" -> println("CLIENTE NUEVO: $nombreCliente - Registro inicial requerido")
        else -> println("Nivel no reconocido para el cliente: $nombreCliente")
    }
}