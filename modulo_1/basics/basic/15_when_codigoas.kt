// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
  println("Controles de Flujo When")
  println("Nombre del Paciente:")
  val nombrePaciente = readLine()?.trim() ?:"Sin identificacion"
  println("Tiene Nivel Alerta(Critico/Moderno/Leve")
  val nivel = readLine()?.trim()?.uppercase()?:""
  when(nivel){
  "CRITICO"->{
            println("ALERTA CRITICA: Paciente: $nombrePaciente")
            println("Priorizar la sala de espera")
            println("Reevaluar en 15 minutos")
        }
        "URGENTE"->{
            println("URGENTE: Paciente: $nombrePaciente")
            println("Priorizar en la sala de espera")
            println("Reevaluar en 15 minutos")
        }
        "MODERADO"-> println("Moderado: Paciente: $nombrePaciente")
        "LEVE"->println("Leve: paciente: $nombrePaciente continuamos en .0")
    }
}