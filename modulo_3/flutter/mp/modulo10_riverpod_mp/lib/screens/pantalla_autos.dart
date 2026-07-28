// lib/screens/pantalla_autos.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auto_modelo.dart';
import '../providers/autos_provider_mp.dart';

class PantallaAutos extends ConsumerWidget {
  const PantallaAutos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autos = ref.watch(autosProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Autos (${autos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: autos.isEmpty
          ? const Center(child: Text('Sin autos'))
          : ListView.separated(
              itemCount: autos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final a = autos[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: a.aireAcondicionado
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.directions_car,
                        color: a.aireAcondicionado ? Colors.green : Colors.grey),
                  ),
                  title: Text(a.marcaModelo,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('Placa: ${a.placa} | Cap: ${a.capacidadPasajeros}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          a.favorito ? Icons.star : Icons.star_border,
                          color: a.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(autosProvider.notifier)
                            .toggleFavorito(a.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(autosProvider.notifier)
                            .eliminar(a.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(autosProvider.notifier).agregar(
            AutoAlquiler(
              id: id,
              marcaModelo: 'Auto Nuevo $id',
              placa: 'PL-${autos.length + 100}',
              capacidadPasajeros: 5,
              aireAcondicionado: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}