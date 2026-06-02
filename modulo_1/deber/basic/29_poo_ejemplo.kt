fun main() {
    val ubicacion = UbicacionAuto(10.5, -66.9)
    println("Ubicación: ${ubicacion.lat}, ${ubicacion.lon}")

    val alquiler = DiasAlquiler()
    alquiler.incrementar()
    alquiler.incrementar()
    println("Días: ${alquiler.dias}")

    val cliente = ClienteTemporal("ana")
    println(cliente.nombreMayuscula)
}