class Vehiculo(val modelo: String)

open class Auto(val modelo: String, val tipo: String) {
    open fun mostrarTipo() = println("$modelo es un $tipo")
    open fun descripcion() = "Vehículo: $modelo"
    fun encender() = println("$modelo encendido")
}

class AutoEconomico(modelo: String) : Auto(modelo, "Económico") {
    override fun mostrarTipo() {
        super.mostrarTipo()
        println("Bajo consumo de combustible")
    }
    override fun descripcion() = "${super.descripcion()}, categoría económica"
}

class AutoLujo(modelo: String, val tieneChofer: Boolean) : Auto(modelo, "Lujo") {
    override fun descripcion() =
        "${super.descripcion()}, lujo ${if (tieneChofer) "con chofer" else "sin chofer"}"
}

fun main() {
    val economico = AutoEconomico("Kia Rio")
    economico.mostrarTipo()

    val lujo = AutoLujo("BMW Serie 7", true)
    println(lujo.descripcion())

    economico.encender()
}