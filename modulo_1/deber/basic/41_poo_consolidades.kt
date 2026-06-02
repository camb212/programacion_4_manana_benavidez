sealed class Notificacion(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String

    data class Email(
        val cliente: String,
        val asunto: String,
        val detalle: String
    ) : Notificacion(asunto, detalle) {
        override fun formatear() =
            "📧 Email → $cliente\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class Push(val dispositivo: String, val auto: String)
        : Notificacion("Alquiler confirmado", auto) {
        override fun formatear() =
            "🔔 Push → $dispositivo: $titulo - $mensaje"
    }

    data class Sms(val telefono: String, val texto: String)
        : Notificacion("Alquiler", texto) {
        override fun formatear() =
            "📱 SMS → $telefono: ${mensaje.take(160)}"
    }

    object Silenciosa : Notificacion("", "") {
        override fun formatear() = "🔕 Notificación silenciosa de alquiler"
    }
}

interface EnviadorNotificacion {
    val nombre: String
    fun enviar(notificacion: Notificacion): Boolean
}

class ServicioEmail : EnviadorNotificacion {
    override val nombre = "Email"
    override fun enviar(n: Notificacion): Boolean {
        if (n !is Notificacion.Email) return false
        println("  [EMAIL] → ${n.cliente}")
        return true
    }
}

class ServicioPush : EnviadorNotificacion {
    override val nombre = "Push"
    override fun enviar(n: Notificacion): Boolean {
        if (n !is Notificacion.Push) return false
        println("  [PUSH] → ${n.dispositivo}")
        return true
    }
}

class Dispatcher(private val servicios: List<EnviadorNotificacion>) {

    fun enviar(notificacion: Notificacion) {
        println(notificacion.formatear())
        val exito = servicios.any { it.enviar(notificacion) }
        if (!exito) println("  ⚠️ Sin servicio disponible para alquiler de auto")
        println()
    }
}

fun main() {
    val dispatcher = Dispatcher(listOf(ServicioEmail(), ServicioPush()))

    listOf(
        Notificacion.Email("ana@test.com", "Reserva de auto", "Tu alquiler fue confirmado."),
        Notificacion.Push("iPhone-Ana", "Kia Rio reservado"),
        Notificacion.Sms("+593999999999", "Tu auto está listo para recoger"),
        Notificacion.Silenciosa
    ).forEach { dispatcher.enviar(it) }
}