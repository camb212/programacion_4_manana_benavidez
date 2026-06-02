fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Funciones - Parámetros por defecto")

    println(crearCliente("Jhon", 25, "Premium", true))
    println(crearCliente("Luis"))
    println(crearCliente("Maria", 30))
    println(crearCliente("Juan", 30, "Premium", true))

    println(crearCliente(nombre = "Yamilet", edad = 30, activo = false))
}

fun crearCliente(
    nombre: String,
    edad: Int = 18,
    tipo: String = "Estándar",
    activo: Boolean = true
): String {
    return "Cliente[$nombre, edad=$edad, tipo=$tipo, activo=$activo]"
}
