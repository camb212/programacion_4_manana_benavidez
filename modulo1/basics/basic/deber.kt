fun main() {
    var cantidad = 0
    var totalBruto = 0.0
    var totalNeto = 0.0

    while (true) {
        println("--- MENU CLINICA ---")
        println("1. Registrar")
        println("2. Resumen")
        println("3. Descuento")
        println("0. Salir")
        
        val entrada = readLine()
        val opcion = entrada?.toIntOrNull()

        when (opcion) {
            1 -> {
                println("Servicio (1.Consulta 2.Lab 3.Imagen):")
                val tipo = readLine()?.toIntOrNull() ?: 1
                
                println("Precio base:")
                val precio = readLine()?.toDoubleOrNull() ?: 0.0
                
                println("Seguro (1.Basico 2.Premium 3.Sin):")
                val seguro = readLine()?.toIntOrNull() ?: 3
                
                val porcentaje = when (seguro) {
                    1 -> 0.10
                    2 -> 0.05
                    else -> 1.0
                }
                
                val pago = precio * porcentaje
                
                cantidad = cantidad + 1
                totalBruto = totalBruto + precio
                totalNeto = totalNeto + pago
                
                println("A pagar: " + pago)
            }
            2 -> {
                println("Servicios: " + cantidad)
                println("Monto Bruto: " + totalBruto)
                println("Monto Neto: " + totalNeto)
            }
            3 -> {
                println("Codigo:")
                val c = readLine()
                println("Porcentaje de rebaja:")
                val p = readLine()?.toDoubleOrNull() ?: 0.0
                
                val rebaja = totalNeto * (p / 100)
                totalNeto = totalNeto - rebaja
                println("Descuento aplicado")
            }
            0 -> {
                println("--- FACTURA FINAL ---")
                println("Total de servicios: " + cantidad)
                println("Total Bruto: " + totalBruto)
                println("Total Neto Final: " + totalNeto)
                println("Cerrando...")
                
                break
            }
            else -> {
                println("Opcion no valida")
            }
        }
    }
}