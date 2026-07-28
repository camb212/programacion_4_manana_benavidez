// lib/screens/pantalla_autos.dart
import 'package:flutter/material.dart';
import '../models/auto_modelo.dart';
import '../widgets/fila_auto.dart';
import '../widgets/tarjeta_auto_grid.dart';

class PantallaAutos extends StatefulWidget {
  const PantallaAutos({super.key});
  
  @override
  State<PantallaAutos> createState() => _PantallaAutosState();
}

class _PantallaAutosState extends State<PantallaAutos> {
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

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleFavorito(int i) =>
      setState(() => _autos[i].favorito = !_autos[i].favorito);

  void _eliminar(int i) => setState(() => _autos.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Autos (${_autos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _autos.length,
              itemBuilder: (ctx, i) => TarjetaAutoGrid(
                auto: _autos[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount: _autos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaAuto(
                auto: _autos[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}