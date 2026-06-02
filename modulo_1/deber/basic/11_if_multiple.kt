fun main() {
    println("=== Sistema de Alquiler de Autos ===")
    println("Condicional If - Múltiples Condiciones")

    println("Ingrese días de alquiler:")

    val dias = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (dias <= 1) {
        "Alquiler por horas"
    } else if (dias <= 3) {
        "Alquiler corto"
    } else if (dias <= 7) {
        "Alquiler semanal"
    } else if (dias <= 15) {
        "Alquiler quincenal"
    } else if (dias <= 30) {
        "Alquiler mensual"
    } else {
        "Alquiler prolongado"
    }

    println("Clasificación: $clasificacion")
    println("Clasificación: ${clasificacion.uppercase()}")
}