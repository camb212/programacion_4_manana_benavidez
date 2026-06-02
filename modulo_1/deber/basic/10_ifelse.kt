fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Condicional If - Else")

    println("¿Desea seguro del vehículo? s/n: ")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"

    println("Costo base del alquiler: ")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (tieneSeguro) {
        val total = costoBase * 1.20
        println("Total con seguro: $${"%.2f".format(total)}")
    } else {
        println("Total sin seguro: $${"%.2f".format(costoBase)}")
    }
}