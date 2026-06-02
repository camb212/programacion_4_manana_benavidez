fun main() {
    println("=== Sistema de Alquiler de Autos ===")

    println("Set inmutables")
    val autos = setOf("Toyota", "Chevrolet", "Nissan", "Kia", "Toyota", "Nissan")
    println("Autos: $autos")

    println("Operaciones de conjuntos")
    val disponibles = setOf("Toyota", "Kia", "Mazda", "Hyundai")
    val rentados = setOf("Nissan", "Mazda", "Ford")

    println("Disponibles: $disponibles")
    println("Rentados: $rentados")

    println("Unión: ${disponibles union rentados}")
    println("Intersección: ${disponibles intersect rentados}")
    println("Diferencia: ${disponibles subtract rentados}")

    println("Set mutables")
    val categorias = mutableSetOf("Económico", "SUV", "Sedán")
    println(categorias)

    categorias.add("Económico")
    println(categorias)

    categorias.add("Deportivo")
    println(categorias)

    categorias.add("Eléctrico")
    println(categorias)

    println("Existe 'SUV': ${"SUV" in categorias}")
    println("Existe 'Pickup': ${"Pickup" in categorias}")
}
