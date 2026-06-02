data class Categoria(val id: Int, val nombre: String)

data class Auto(
    val id: Int,
    val modelo: String,
    val precioPorDia: Double,
    val disponibleDias: Int,
    val categoria: Categoria,
    val activo: Boolean = true
) {
    val disponible: Boolean get() = activo && disponibleDias > 0
    val precioConIva: Double get() = precioPorDia * 1.19

    fun aplicarDescuento(porcentaje: Double): Auto {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precioPorDia = precioPorDia * (1 - porcentaje / 100))
    }
}

object CatalogoAutos {
    private val categorias = mutableListOf(
        Categoria(1, "Económico"),
        Categoria(2, "SUV"),
        Categoria(3, "Lujo")
    )
    private val autos = mutableListOf<Auto>()
    private var siguienteId = 1

    fun agregarAuto(modelo: String, precioPorDia: Double, disponibleDias: Int, categoriaId: Int): Auto? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val auto = Auto(siguienteId++, modelo, precioPorDia, disponibleDias, categoria)
        autos.add(auto)
        return auto
    }

    fun listar(): List<Auto> = autos.toList()
    fun disponibles(): List<Auto> = autos.filter { it.disponible }
    fun porCategoria(id: Int): List<Auto> = autos.filter { it.categoria.id == id }
    fun buscar(query: String): List<Auto> =
        autos.filter { it.modelo.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoAutos.agregarAuto("Toyota Corolla", 45.0, 10, 1)
    CatalogoAutos.agregarAuto("Hyundai Tucson", 80.0, 0, 2)
    CatalogoAutos.agregarAuto("BMW X5", 150.0, 5, 3)
    CatalogoAutos.agregarAuto("Kia Rio", 40.0, 8, 1)

    println("=== Todos los autos ===")
    CatalogoAutos.listar().forEach { a ->
        val estado = if (a.disponible) "✅" else "❌"
        println("$estado ${a.modelo} — ${"%.2f".format(a.precioConIva)}")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoAutos.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("${it.modelo}: ${"%.2f".format(it.precioPorDia)}") }

    println("\n=== Listado simple ===")
    for (auto in CatalogoAutos.listar()) {
        println(auto.modelo)
    }
}