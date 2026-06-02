interface Serializable {
    val id: String
    fun serializar(): String
    val version: Int get() = 1
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

data class Alquiler(
    override val id: String,
    val cliente: String,
    val auto: String,
    val dias: Int,
    val total: Double
) : Serializable, Validable {

    override fun serializar() =
        "$id|$cliente|$auto|$dias|$total"

    override val errores: List<String> get() = buildList {
        if (cliente.isBlank()) add("El cliente no puede estar vacío")
        if (auto.isBlank())    add("Debe seleccionar un auto")
        if (dias <= 0)         add("Los días deben ser mayores a cero")
        if (total <= 0)        add("El total debe ser mayor que cero")
    }

    override fun validar() = esValido
}

fun main() {
    val alquiler1 = Alquiler("A001", "Ana", "Kia Rio", 3, 150.0)
    val alquiler2 = Alquiler("A002", "", "", 0, -10.0)

    fun procesarSerializable(s: Serializable) = println("→ ${s.serializar()}")
    fun procesarValidable(v: Validable) {
        println("Válido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarSerializable(alquiler1)
    procesarValidable(alquiler1)
    procesarValidable(alquiler2)
}