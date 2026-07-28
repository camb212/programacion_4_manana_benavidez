// lib/screens/pantalla_busqueda_autos.dart
import 'package:flutter/material.dart';
import '../models/auto_modelo.dart';
import '../widgets/fila_auto.dart';
import '../widgets/tarjeta_auto_grid.dart';

class PantallaBusquedaAutos extends StatefulWidget {
  const PantallaBusquedaAutos({super.key});
  
  @override
  State<PantallaBusquedaAutos> createState() => _PantallaBusquedaAutosState();
}

class _PantallaBusquedaAutosState extends State<PantallaBusquedaAutos> {
  final _autos = [
    AutoAlquiler(
      id: '1', 
      marca: 'Toyota', 
      modelo: 'Corolla 2024', 
      patente: 'AB-123-CD', 
      capacidadPasajeros: 5, 
      transmision: 'Automática', 
      precioPorDia: 45.0, 
      aireAcondicionado: true, 
      favorito: true
    ),
    AutoAlquiler(
      id: '2', 
      marca: 'Volkswagen', 
      modelo: 'Gol 2023', 
      patente: 'EF-456-GH', 
      capacidadPasajeros: 5, 
      transmision: 'Manual', 
      precioPorDia: 30.0, 
      aireAcondicionado: true
    ),
    AutoAlquiler(
      id: '3', 
      marca: 'Jeep', 
      modelo: 'Renegade 2024', 
      patente: 'IJ-789-KL', 
      capacidadPasajeros: 5, 
      transmision: 'Automática', 
      precioPorDia: 75.0, 
      aireAcondicionado: true
    ),
    AutoAlquiler(
      id: '4', 
      marca: 'Renault', 
      modelo: 'Kwid 2022', 
      patente: 'MN-012-OP', 
      capacidadPasajeros: 4, 
      transmision: 'Manual', 
      precioPorDia: 25.0, 
      aireAcondicionado: false
    ),
  ];

  String _busqueda = '';    // texto actual de la búsqueda
  bool _modoGrid = false;

  // Getter calculado — filtra sin modificar _autos
  List<AutoAlquiler> get _filtrados => _autos
      .where((a) =>
          a.marca.toLowerCase().contains(_busqueda.toLowerCase()) ||
          a.modelo.toLowerCase().contains(_busqueda.toLowerCase()) ||
          a.patente.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleFavorito(AutoAlquiler a) =>
      setState(() => a.favorito = !a.favorito);

  void _eliminar(AutoAlquiler a) =>
      setState(() => _autos.removeWhere((x) => x.id == a.id));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;   // evalúa el getter una sola vez

    return Scaffold(
      appBar: AppBar(
        title: Text('Autos (${_autos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: Column(
        children: [
          // ── SearchBar ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por marca, modelo o patente...',
              leading: const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // ── Contador de resultados ────────────────────────────────
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),

          // ── Lista o Grid ──────────────────────────────────────────
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaAutoGrid(
                          auto: filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaAuto(
                          auto: filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}