class Auto(val modelo: String, val placa: String) {

    val modeloNormalizado: String
    val codigoPais: String

    init {
    
        require(modelo.isNotBlank()) { "El modelo del auto no puede estar vacío" }
        require(placa.contains("-")) { "Placa inválida: $placa" }

      
        modeloNormalizado = modelo.trim().lowercase()

        codigoPais = placa.substringBefore("-")
    }
}

fun main() {

    val auto = Auto("  Toyota Corolla  ", "EC-1234")

    println(auto.modeloNormalizado) 
    println(auto.codigoPais)        

 
}