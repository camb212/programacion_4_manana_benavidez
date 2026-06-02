fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Ciclos Repetitivos - While")

    var contador = 1
    while (contador <= 5) {
        println("Reserva $contador")
        contador++
    }

    println("Do While")
    contador = 1
    do {
        println("Día de alquiler $contador")
        contador++
    } while (contador <= 5)

    println("While con continue y break")
    contador = 0
    while (contador <= 10) {
        contador++
        if (contador == 3) continue
        if (contador == 7) break
        println("Proceso $contador")
    }

    var input: String
    while (true) {
        println("Escribe 'salir' para terminar: ")
        input = readLine() ?: ""
        if (input.lowercase() == "salir") break
        println("Cliente ingresó: $input")
    }
}