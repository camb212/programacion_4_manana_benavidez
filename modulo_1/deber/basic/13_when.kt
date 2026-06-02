fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Control de Flujo When")

    println("Ingrese código del vehículo:")
    val codigo = readLine()?.toIntOrNull() ?: 0

    val tipoVehiculo = when (codigo) {
        1 -> "Económico"
        2 -> "Sedán"
        3 -> "SUV"
        4 -> "Camioneta"
        5 -> "Deportivo"
        6 -> "Eléctrico"
        else -> "Vehículo no registrado en el sistema"
    }

    println("Tipo de vehículo: $tipoVehiculo")
}