fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Operadores de comparación")
    
    val edadCliente = 20
    val edadMinima = 21
    
    val diasSolicitados = 3
    val diasMinimos = 1
    
    println("Comparación de edad")
    println("$edadCliente == $edadMinima : ${edadCliente == edadMinima}")  
    println("$edadCliente != $edadMinima : ${edadCliente != edadMinima}") 
    println("$edadCliente < $edadMinima : ${edadCliente < edadMinima}")     
    println("$edadCliente <= $edadMinima : ${edadCliente <= edadMinima}")   
    println("$edadCliente > $edadMinima : ${edadCliente > edadMinima}")     
    println("$edadCliente >= $edadMinima : ${edadCliente >= edadMinima}")   
    
    println("\nValidaciones del sistema")
    
    val acceso = edadCliente >= edadMinima
    println("¿Puede alquilar? : $acceso")
    
    val diasValidos = diasSolicitados >= diasMinimos
    println("¿Días válidos? : $diasValidos")
}