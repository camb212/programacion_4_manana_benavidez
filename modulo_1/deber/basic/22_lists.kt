fun main() {
    println("=== Sistema de Alquiler de Autos ===")

    val autos = listOf("Toyota", "Chevrolet", "Nissan", "Chevrolet", "Kia")

    println("Elemento índice 0: ${autos[0]}")
    println("Primer elemento: ${autos.first()}")
    println("Último elemento: ${autos.last()}")

    println("Elemento índice 2: ${autos.get(2)}")
    println("Índice de 'Chevrolet': ${autos.indexOf("Chevrolet")}")
    println("Existe 'Nissan': ${autos.contains("Nissan")}")
    println("Existe 'Kia': ${"Kia" in autos}")

    println("Sublista: ${autos.subList(1, 3)}")
    println("Primeros 2: ${autos.take(2)}")
    println("Eliminar primeros 3: ${autos.drop(3)}")
    println("Últimos 2: ${autos.takeLast(2)}")

    for (auto in autos) {
        println(auto)
    }

    val disponibles = mutableListOf("Blanco", "Azul", "Negro", "Rojo")

    println(disponibles)
    disponibles.add("Gris")
    println(disponibles)

    disponibles.add(0, "Plateado")
    println(disponibles)

    disponibles.remove("Gris")
    println(disponibles)

    disponibles[1] = "Verde"
    println(disponibles)

    val deque = ArrayDeque<Int>()

    println(deque)
    deque.addFirst(1)
    println(deque)

    deque.addLast(2)
    println(deque)

    deque.addLast(3)
    println(deque)

    deque.addFirst(0)
    println(deque)

    deque.addLast(4)
    println(deque)
}