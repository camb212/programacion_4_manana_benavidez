fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println(mensajeBienvenida())

    val total: Double = calcularCosto(5, 20.0)
    println(total)

    println("${aplicarDescuento(100.0, 10.0)}")
    println(aplicarDescuento(100.0, 10.0))
    println(calcularImpuesto(100.0, 12.0))

    mostrarCliente("Pedro")
}

fun calcularCosto(dias: Int, precioDia: Double): Double {
    return dias * precioDia
}

fun mensajeBienvenida(): String {
    return "Bienvenido al sistema de alquiler"
}

fun aplicarDescuento(monto: Double, descuento: Double) = monto - (monto * descuento / 100)

fun calcularImpuesto(monto: Double, impuesto: Double) = monto + (monto * impuesto / 100)

fun mostrarCliente(nombre: String) {
    println("Cliente: $nombre")
}fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println(mensajeBienvenida())

    val total: Double = calcularCosto(5, 20.0)
    println(total)

    println("${aplicarDescuento(100.0, 10.0)}")
    println(aplicarDescuento(100.0, 10.0))
    println(calcularImpuesto(100.0, 12.0))

    mostrarCliente("Pedro")
}

fun calcularCosto(dias: Int, precioDia: Double): Double {
    return dias * precioDia
}

fun mensajeBienvenida(): String {
    return "Bienvenido al sistema de alquiler"
}

fun aplicarDescuento(monto: Double, descuento: Double) = monto - (monto * descuento / 100)

fun calcularImpuesto(monto: Double, impuesto: Double) = monto + (monto * impuesto / 100)

fun mostrarCliente(nombre: String) {
    println("Cliente: $nombre")
}