abstract class Vehiculo(val nombre: String) {
    abstract val costoPorDia: Double
    abstract val capacidad: Int
    abstract fun descripcion(): String

    fun comparar(otro: Vehiculo): String = when {
        costoPorDia > otro.costoPorDia -> "$nombre es más caro que ${otro.nombre}"
        costoPorDia < otro.costoPorDia -> "$nombre es más barato que ${otro.nombre}"
        else -> "$nombre y ${otro.nombre} tienen el mismo costo"
    }

    override fun toString() =
        "${descripcion()} | Costo por día: $${"%.2f".format(costoPorDia)}"
}

class AutoEconomico(val modelo: String) : Vehiculo("Auto Económico") {
    override val costoPorDia: Double get() = 30.0
    override val capacidad: Int get() = 4
    override fun descripcion() = "$nombre modelo $modelo con capacidad $capacidad personas"
}

class SUV(val modelo: String) : Vehiculo("SUV") {
    override val costoPorDia: Double get() = 60.0
    override val capacidad: Int get() = 7
    override fun descripcion() = "$nombre modelo $modelo con capacidad $capacidad personas"
}

class AutoLujo(val modelo: String) : Vehiculo("Auto de Lujo") {
    override val costoPorDia: Double get() = 120.0
    override val capacidad: Int get() = 5
    override fun descripcion() = "$nombre modelo $modelo con capacidad $capacidad personas"
}

fun main() {
    val vehiculos: List<Vehiculo> = listOf(
        AutoEconomico("Kia Rio"),
        SUV("Toyota Prado"),
        AutoLujo("BMW Serie 7")
    )

    vehiculos.forEach { println(it) }

    val masCaro = vehiculos.maxByOrNull { it.costoPorDia }
    println("\nVehículo más caro: ${masCaro?.nombre}")

    println(vehiculos[0].comparar(vehiculos[1]))
}