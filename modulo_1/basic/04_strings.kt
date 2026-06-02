/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
    val nombre= "Peter"
    val apellido= "Park"
    val edad= 28
    //variable simple
    
    println("hola $nombre")
    //expresion
    println("nombre completo : ${nombre.uppercase()} ${apellido.uppercase()}")
    val nombreCompleto = "nombre completo : ${nombre.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)
    println("Edad : ${edad + 6} años")
    
val tarjeta = """
       |Nombre: $nombre $apellido
       |Edad: $edad
       |Acceso: ${if(edad>=18) "Permitido" else "Denegado"} 
   """.trimMargin()
   println(tarjeta)
}



