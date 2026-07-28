// lib/widgets/tarjeta_auto_grid.dart
import 'package:flutter/material.dart';
import '../models/auto_modelo.dart';

class TarjetaAutoGrid extends StatelessWidget {
  final AutoAlquiler auto;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaAutoGrid({
    super.key,
    required this.auto,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + favorito
            Row(children: [
              Icon(
                Icons.directions_car,
                color: auto.aireAcondicionado ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  auto.favorito ? Icons.star : Icons.star_border,
                  color: auto.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Marca/Modelo y Patente
            Text(
              '${auto.marca} ${auto.modelo}',
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Patente: ${auto.patente}',
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),

            // Fila inferior: Aire + Transmisión/Precio + eliminar
            Row(children: [
              if (auto.aireAcondicionado)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.ac_unit, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  '${auto.transmision} | \$${auto.precioPorDia.toStringAsFixed(0)}',
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}