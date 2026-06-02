class Rectangulo(val ancho: Double, val alto: Double) {
    val area: Double get() = ancho * alto
    val perimetro: Double get() = 2 * (ancho + alto)

    constructor(lado: Double) : this(lado, lado)
    constructor(ancho: Int, alto: Int) : this(ancho.toDouble(), alto.toDouble())

    override fun toString() = "Rectángulo(${ancho}x${alto}) | área=${area}"
}

fun main() {
    val r1 = Rectangulo(5.0, 3.0)
    val r2 = Rectangulo(4.0)
    val r3 = Rectangulo(6, 2)

    println(r1)
    println(r2)
    println(r3)
}