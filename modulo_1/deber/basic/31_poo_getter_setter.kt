class TemperaturaAuto(celsius: Double) {

    var celsius: Double = celsius
        set(value) {
            require(value >= -273.15) { "Temperatura inválida para el sistema del auto" }
            field = value
        }

    val fahrenheit: Double
        get() = celsius * 9.0 / 5.0 + 32.0

    val kelvin: Double
        get() = celsius + 273.15

    val estado: String
        get() = when {
            celsius < 0   -> "Motor muy frío"
            celsius < 40  -> "Motor frío"
            celsius < 90  -> "Temperatura normal"
            celsius < 110 -> "Motor caliente"
            else          -> "Sobrecalentamiento"
        }
}

fun main() {
    val temp = TemperaturaAuto(85.0)

    println("${temp.celsius}°C = ${temp.fahrenheit}°F = ${temp.kelvin}K")
    println(temp.estado)

    temp.celsius = 20.0
    println("${temp.celsius}°C → ${temp.estado}")
}