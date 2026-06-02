class Cliente(val nombre: String, val edad: Int)

class ClienteAlquiler(val nombre: String, val edad: Int) {

    fun presentarse(): String {
        return "Cliente: $nombre, Edad: $edad"
    }

    fun puedeAlquilar(): Boolean {
        return edad >= 21
    }
}

fun main() {
    val cliente1 = Cliente("Ana", 28)
    println("Nombre: ${cliente1.nombre}")
    println("Edad: ${cliente1.edad}")

    val cliente2 = ClienteAlquiler("Luis", 19)
    println(cliente2.presentarse())
    println("¿Puede alquilar? ${cliente2.puedeAlquilar()}")
}