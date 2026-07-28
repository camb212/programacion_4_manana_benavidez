// lib/widgets/fila_auto.dart
import 'package:flutter/material.dart';
import '../models/auto_modelo.dart';

class FilaAuto extends StatelessWidget {
  final AutoAlquiler auto; 
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaAuto({
    super.key,
    required this.auto,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final bool tieneAire = auto.aireAcondicionado;
    final bool esFavorito = auto.favorito;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: tieneAire
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.directions_car,
          color: tieneAire ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        '${auto.marca} ${auto.modelo}',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Patente: ${auto.patente} | Trans: ${auto.transmision} | \$${auto.precioPorDia.toStringAsFixed(0)}/día',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.star : Icons.star_border,
              color: esFavorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:      esFavorito ? 'Quitar favorito' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}