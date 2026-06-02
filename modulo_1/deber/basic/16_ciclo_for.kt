fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Ciclos Repetitivos - FOR")

    println("For con rango")
    for (i in 1..10) {
        println("Día $i - Costo: ${i * 20}")
    }

    println("For con until")
    for (i in 1 until 5) {
        print("Auto $i ")
    }
    println()

    println("For con pasos")
    for (i in 1..10 step 3) {
        print("ID $i ")
    }
    println()

    println("Por descendente")
    for (i in 10 downTo 1) {
        print("Auto $i ")
    }
    println()

    println("For con listas")
    val clientes = listOf("Juan", "Maria", "Jose")
    for (cliente in clientes) {
        println(cliente)
    }

    println("For con listas index valor")
    for ((index, valor) in clientes.withIndex()) {
        println("$index -> $valor")
    }

    println("For con continue (salta el 3)")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("Reserva $i")
    }

    println("For con break (se detiene en 7)")
    for (i in 1..10) {
        if (i == 7) {
            break
        }
        println("Reserva $i")
    }

    val alquileres = listOf(
        Triple("Juan", 3, 60.0),
        Triple("Maria", 7, 140.0),
        Triple("Jose", 1, 20.0)
    )

    for ((posicion, alquiler) in alquileres.withIndex()) {
        val (nombre, dias, costo) = alquiler
        val tipo = if (dias > 5) "Largo" else "Corto"
        val estado = if (costo > 100) "Alto" else "Normal"

        println("Registro $posicion - $nombre - Días: $dias - Tipo: $tipo - Costo: $costo - Estado: $estado")
    }
}