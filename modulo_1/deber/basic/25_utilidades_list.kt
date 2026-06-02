fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Utilidades List")

    val precios = listOf(20, 30, 40, 50, 60)
    println(precios)

    val dobles = precios.map { it * 2 }
    println(dobles)

    val texto = precios.map { "Precio$it" }
    println(texto)

    val caros = precios.filter { it > 40 }
    println(caros)

    val economicos = precios.filter { it <= 40 }
    println(economicos)

    val filtrados = precios.filter { it > 30 && it < 60 }
    println(filtrados)

    val noEconomicos = precios.filterNot { it <= 40 }
    println(noEconomicos)

    val mezcla: List<Any> = listOf(20, "Auto", 30, "SUV", true, 50)
    val soloStrings = mezcla.filterIsInstance<String>()
    println(soloStrings)

    val suma = precios.reduce { acc, n -> acc + n }
    println(suma)

    val producto = precios.reduce { acc, n -> acc * n }
    println(producto)

    val sumaFold = precios.fold(100) { acc, n -> acc + n }
    println(sumaFold)

    val productoFold = precios.fold(1) { acc, n -> acc * n }
    println(productoFold)

    println("Ascendente: ${precios.sorted()}")
    println("Descendente: ${precios.sortedDescending()}")
    println("Orden personalizado: ${precios.sortedBy { -it }}")

    println("Suma: ${precios.sum()}")
    println("Promedio: ${precios.average()}")
    println("Mínimo: ${precios.minOrNull()}")
    println("Máximo: ${precios.maxOrNull()}")
    println("Contar > 40: ${precios.count { it > 40 }}")

    println("Buscar > 40: ${precios.find { it > 40 }}")
    println("Buscar último > 40: ${precios.findLast { it > 40 }}")
    println("Any > 40: ${precios.any { it > 40 }}")
    println("All > 10: ${precios.all { it > 10 }}")
    println("None > 100: ${precios.none { it > 100 }}")
}