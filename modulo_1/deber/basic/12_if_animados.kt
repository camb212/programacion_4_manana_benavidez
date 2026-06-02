fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Condicional If - Anidado")

    println("¿Tiene licencia de conducir? s/n")
    val tieneLicencia = readLine()?.trim()?.lowercase() == "s"

    println("Edad del cliente:")
    val edad = readLine()?.toIntOrNull() ?: 0

    if (tieneLicencia) {
        println("Cliente con licencia")
        if (edad < 21) {
            println("No cumple la edad mínima para alquilar")
        } else if (edad > 70) {
            println("Requiere validación adicional")
        } else {
            println("Cliente apto para alquilar")
        }
    } else {
        println("Cliente sin licencia")
        if (edad < 21 || edad > 70) {
            println("No cumple condiciones para alquilar")
        } else {
            println("Debe presentar licencia válida")
        }
    }
}