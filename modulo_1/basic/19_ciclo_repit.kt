fun main() {
    println("Controles de Flujo Iteraciones, Ciclo repetitivos - Ciclo While")
    println("¿Cuántas mediciones tomar para calcular la frecuencia cardiaca?")

    val medicaciones = readLine()?.toIntOrNull() ?: 0
    var totalPulsaciones = 0

    repeat(medicaciones) { i ->
        println("Medición ${i + 1} (pulsos en 15 seg.)")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4 // convertir a 60 segundos
    }

    val promedio = if (medicaciones > 0) totalPulsaciones / medicaciones else 0

    println("Frecuencia cardiaca promedio: $promedio lpm")

    val clasificacion = when {
        promedio < 60 -> "Bradicardia"
        promedio <= 100 -> "Normal"
        else -> "Taquicardia"
    }

    println("Clasificación: $clasificacion")
}



