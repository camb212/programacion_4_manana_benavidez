class Auto(
    val id: Int,
    val modelo: String,
    val precioPorDia: Double,
    private val disponibleDias: Int
) {

    val precioConImpuesto: Double
        get() = precioPorDia * 1.19

    val disponible: Boolean
        get() = disponibleDias > 0

    override fun toString(): String {
        return "$modelo ($${"%.2f".format(precioPorDia)} por día)"
    }
}

fun main() {
    val auto = Auto(1, "Toyota Corolla", 50.0, 5)

    println("Disponible: ${auto.disponible}")
    println("Precio con impuesto: $${"%.2f".format(auto.precioConImpuesto)}")

    println(auto)
}