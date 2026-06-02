interface Pagable {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : Pagable {
    override val nombre = "Tarjeta de crédito"
    override fun procesar(monto: Double): Boolean {
        println("💳 Cobrando $${"%.2f".format(monto)} por alquiler al número $numero")
        return true
    }
}

class Transferencia(val banco: String) : Pagable {
    override val nombre = "Transferencia bancaria"
    override fun procesar(monto: Double): Boolean {
        println("🏦 Transfiriendo $${"%.2f".format(monto)} desde $banco")
        return true
    }
}

class Efectivo : Pagable {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("💵 Pago en efectivo por alquiler: $${"%.2f".format(monto)}")
        return true
    }
}

fun cobrarAlquiler(monto: Double, metodoPago: Pagable) {
    println("Procesando pago del alquiler con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago exitoso" else "❌ Pago fallido")
}

fun main() {
    val metodos: List<Pagable> = listOf(
        TarjetaCredito("**** **** **** 1234"),
        Transferencia("Banco Pichincha"),
        Efectivo()
    )

    metodos.forEach { cobrarAlquiler(150.0, it) }
}