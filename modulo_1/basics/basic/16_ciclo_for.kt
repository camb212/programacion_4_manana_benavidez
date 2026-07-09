fun main() {
    println("Controles de Flujo CICLOS REPETITIVOS CICLO - FOR")

    println("For con rango")
    for (i in 1..10) {
        println("$i * 5 = ${i * 5}")
    }

    println("For con until")
    for (i in 1 until 5) {
        print("$i ")
    }
    println()

    println("For con pasos")
    for (i in 1..10 step 3) {
        print("$i ")
    }
    println()

    println("Por descendente")
    for (i in 10 downTo 1) {
        print("$i ")
    }
    println()

    println("For con listas")
    val nombres = listOf("Juan", "Maria", "Jose")
    for (nombre in nombres) {
        println(nombre)
    }

    println("For con listas index valor")
    for ((index, valor) in nombres.withIndex()) {
        println("$index -> $valor")
    }

    println("For con continue (salta el 3)")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("item $i")
    }

    println("For con break (se detiene en 7)")
    for (i in 1..10) {
        if (i == 7) {
            break
        }
        println("item $i")
    }
    val pacientes = listOf(
      Triple("Garcia, M", 37.2, 98),
      Triple("zambrano, L", 39.1, 94),
      Triple("Torres, R", 40.3, 91),
    )
    for ((posicion, paciente) in pacientes,withIndex()){
    val (nombre, temperatura, spo2) = paciente
    val alertaTemp = if(temperatura, spo2) = paciente
    val alertaTiempo2 = if (spo2<95.0) "Baja" else "Normal"
    printnl("cama $posicion - $nombre - Temp: $temperatura Gdo.Cent.
             $alerTemp -Spo2: $alertaSpo2")
}
