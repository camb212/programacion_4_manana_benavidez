/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
    println("tipos de datos")
    println("numeros enteros")

    val numero1: Byte=127
    println("Numeros Byte $numero1")
    val numero2: Short=32_765
    println("Numeros Short $numero2")
    val numero3: Int=12
    println("Numeros Int $numero3")
    val numero4: Long=12_122-122_122_122
    println("Numeros Long $numero4")
    
    println("Numeros decimales")
    val numero5: Float=3.14f
    println("Numeros Float $numero5")
    val numero6: Double=3.14159
    println("Numeros Double $numero6")
    
    //Inferido
    val nombre="Juan"
    val edad=56
    
    println("Nombre $nombre")
    val nombreTipo=nombre::class.simpleName
    println("Tipo inferior nombre : ${nombreTipo}")
    println("Tipo inferior nombre : ${nombre::class.simpleName}")
    println("Edad: $edad")
    val edadTipo=edad::class.simpleName
    println("Tipo inferior edad : ${edadTipo}")
    println("Edad: $edad")
}











