fun main() {
    println("=== Sistema de Alquiler de Autos ===")

    println("Map inmutables")
    val autos = mapOf(
        "Toyota" to "Corolla",
        "Chevrolet" to "Aveo",
        "Nissan" to "Sentra",
        "Kia" to "Rio"
    )

    println(autos["Toyota"])
    println(autos["Ford"])
    println(autos.getOrDefault("Toyota", "No disponible"))
    println(autos)

    println(autos.keys)
    println(autos.values)
    println(autos.entries)

    for ((marca, modelo) in autos) {
        println("$marca - $modelo")
    }

    println("Map mutables")
    val inventario = mutableMapOf(
        "Toyota" to 5,
        "Chevrolet" to 3,
        "Nissan" to 4,
        "Kia" to 2
    )

    inventario["Mazda"] = 6
    println(inventario)

    inventario["Toyota"] = 10
    println(inventario)

    inventario.remove("Kia")
    println(inventario)

    inventario.getOrPut("Hyundai") { 7 }
    println(inventario)

    inventario.getOrPut("Nissan") { 7 }
    println(inventario)
}