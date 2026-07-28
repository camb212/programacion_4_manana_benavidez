import 'package:flutter/material.dart';

class ContadorLimitado extends StatefulWidget {
  final String       etiqueta;
  final int          limite;
  final Color        color;          // parámetro extra para demostrar widget.param
  final VoidCallback? onLimite;      // callback opcional — se llama al alcanzar el límite
  final String       textoBoton;
  final int          pasoIncremento;

  const ContadorLimitado({
    super.key,
    required this.etiqueta,
    this.limite  = 15,               // Límite por defecto ajustado para rentas (ej: 15 días)
    this.color   = Colors.indigo,
    this.onLimite,
    this.textoBoton = 'Añadir Día',  // Texto adaptado al contexto
    this.pasoIncremento = 1,
  });

  @override
  State<ContadorLimitado> createState() => _ContadorLimitadoState();
}

class _ContadorLimitadoState extends State<ContadorLimitado> {
  int _valor = 0;

  void _incrementar() {
    if (_valor >= widget.limite) return;    // defensa extra
    setState(() => _valor += widget.pasoIncremento);
    if (_valor >= widget.limite) {
      widget.onLimite?.call();              // notifica al padre si registró un callback
    }
  }

  @override
  Widget build(BuildContext context) {
    final enLimite  = _valor >= widget.limite;
    final progreso  = _valor / widget.limite;   // 0.0 → 1.0

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.etiqueta,
            style: TextStyle(
              color: enLimite ? Colors.redAccent : widget.color, 
              fontWeight: FontWeight.w600, 
              fontSize: 16
            )
        ),

        const SizedBox(height: 8),

        // Barra de progreso que refleja el estado de los días de reserva
        LinearProgressIndicator(
          value:           progreso,
          color:           enLimite ? Colors.redAccent : widget.color,
          backgroundColor: widget.color.withOpacity(0.15),
          minHeight: 6,
          borderRadius: BorderRadius.circular(4),
        ),

        const SizedBox(height: 8),

        // Muestra el contador con la palabra "días"
        Text(
          '$_valor / ${widget.limite} días',
          style: TextStyle(
            fontSize:   28,
            fontWeight: FontWeight.bold,
            color:      enLimite ? Colors.redAccent : widget.color,
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: enLimite ? Colors.grey : widget.color,
              ),
              onPressed: enLimite ? null : _incrementar,    // null = desactivado
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: Text(widget.textoBoton),
            ),
            const SizedBox(width: 8),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
              onPressed: () => setState(() => _valor = 0),  // reiniciar
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Limpiar'),
            ),
          ],
        ),

        if (enLimite) ...[
          const SizedBox(height: 4),
          Text('Tiempo máximo de alquiler alcanzado',
              style: TextStyle(fontSize: 12, color: Colors.redAccent, fontWeight: FontWeight.bold)),
        ]
      ],
    );
  }
}