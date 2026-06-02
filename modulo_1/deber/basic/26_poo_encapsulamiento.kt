open class AutoAlquiler(
    val cliente: String,
    val modelo: String,
    precioPorDia: Double
) {

    private var diasAlquilados: Int = 0
    private var precio: Double = precioPorDia

    internal val codigoAlquiler: String =
        "ALQ${(1000..9999).random()}"

    protected open fun calcularCosto(): Double = diasAlquilados * precio

    fun alquilar(dias: Int) {
        require(dias > 0) { "Los días deben ser mayores a 0" }
        diasAlquilados += dias
        println("Auto $modelo alquilado por $dias días")
        println("Total parcial: $${"%.2f".format(calcularCosto())}")
    }

    fun devolver() {
        val total = calcularCosto()
        println("Auto devuelto por $cliente")
        println("Total a pagar: $${"%.2f".format(total)}")
        diasAlquilados = 0
    }

    fun estado(): String {
        return "Cliente: $cliente | Auto: $modelo | Días: $diasAlquilados"
    }
}

// Subclase usando protected
class AutoPremium(
    cliente: String,
    modelo: String,
    precioPorDia: Double
) : AutoAlquiler(cliente, modelo, precioPorDia) {

    override fun calcularCosto(): Double {
        val base = super.calcularCosto()
        return base * 1.2 // recargo premium 20%
    }
}

fun main() {
    val alquiler1 = AutoAlquiler("Ana", "Toyota Corolla", 50.0)
    val alquiler2 = AutoPremium("Luis", "BMW X5", 120.0)

    alquiler1.alquilar(3)
    println(alquiler1.estado())
    alquiler1.devolver()

    println("-----------")

    alquiler2.alquilar(2)
    println(alquiler2.estado())
    alquiler2.devolver()
}