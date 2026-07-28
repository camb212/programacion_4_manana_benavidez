// lib/screens/pantalla_busqueda_autos.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/autos_provider_mp.dart';

class PantallaBusquedaAutos extends ConsumerWidget {
  const PantallaBusquedaAutos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autos = ref.watch(autosFiltradosProvider);
    final busqueda = ref.watch(busquedaAutosProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar autos')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            hintText: 'Buscar por marca, modelo o placa...',
            leading: const Icon(Icons.search),
            trailing: busqueda.isNotEmpty
                ? [IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () =>
                        ref.read(busquedaAutosProvider.notifier).state = '',
                  )]
                : null,
            onChanged: (v) =>
                ref.read(busquedaAutosProvider.notifier).state = v,
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        Expanded(
          child: autos.isEmpty
              ? const Center(child: Text('Sin resultados'))
              : ListView.builder(
                  itemCount: autos.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.directions_car),
                    title: Text(autos[i].marcaModelo),
                    subtitle: Text('Placa: ${autos[i].placa}'),
                  ),
                ),
        ),
      ]),
    );
  }
}