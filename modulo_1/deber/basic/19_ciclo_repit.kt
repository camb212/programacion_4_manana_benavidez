fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Ciclos Repetitivos - While")

    println("¿Cuántos alquileres desea registrar?")

    val cantidad = readLine()?.toIntOrNull() ?: 0
    var totalCosto = 0.0

    repeat(cantidad) { i ->
        println("Alquiler ${i + 1} - costo:")
        val costo = readLine()?.toDoubleOrNull() ?: 0.0
        totalCosto += costo
    }

    val promedio = if (cantidad > 0) totalCosto / cantidad else 0.0

    println("Costo promedio de alquiler: $${"%.2f".format(promedio)}")

    val clasificacion = when {
        promedio < 50 -> "Económico"
        promedio <= 150 -> "Estándar"
        else -> "Premium"
    }

    println("Clasificación: $clasificacion")
}


