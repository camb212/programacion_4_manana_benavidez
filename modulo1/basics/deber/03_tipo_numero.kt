fun main() {
    println("Tipos de datos - Alquiler de carros")
    
    println("Numeros enteros")
    
    val autosDisponibles: Byte = 100
    println("Autos disponibles (Byte): $autosDisponibles")
    
    val kilometraje: Short = 32000
    println("Kilometraje promedio (Short): $kilometraje")
    
    val precioPorDia: Int = 45
    println("Precio por día (Int): $precioPorDia")
    
    val totalGanancias: Long = 120000 - 22000
    println("Ganancias (Long): $totalGanancias")
    
    println("Numeros decimales")
    
    val costoSeguro: Float = 5.75f
    println("Costo seguro (Float): $costoSeguro")
    
    val precioPremium: Double = 89.99
    println("Precio auto premium (Double): $precioPremium")
    
    // Inferido
    val cliente = "Juan"
    val diasAlquiler = 3
    
    println("Cliente: $cliente")
    val clienteTipo = cliente::class.simpleName
    println("Tipo de cliente: $clienteTipo")
    
    println("Dias de alquiler: $diasAlquiler")
    val diasTipo = diasAlquiler::class.simpleName
    println("Tipo de dias: $diasTipo")
    
    // Calculo simple
    val total = diasAlquiler * precioPorDia
    println("Total a pagar: $$total")
}








