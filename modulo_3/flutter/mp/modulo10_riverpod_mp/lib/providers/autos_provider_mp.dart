// lib/providers/autos_provider_mp.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import '../models/auto_modelo.dart';

// NotifierProvider — estado complejo con métodos propios
class AutosNotifier extends Notifier<List<AutoAlquiler>> {
  @override
  List<AutoAlquiler> build() => [
    AutoAlquiler(id: '1', marcaModelo: 'Toyota Corolla', placa: 'AB-123-CD', capacidadPasajeros: 5, aireAcondicionado: true, favorito: true),
    AutoAlquiler(id: '2', marcaModelo: 'Volkswagen Gol', placa: 'EF-456-GH', capacidadPasajeros: 5, aireAcondicionado: true),
    AutoAlquiler(id: '3', marcaModelo: 'Jeep Renegade', placa: 'IJ-789-KL', capacidadPasajeros: 5, aireAcondicionado: false),
    AutoAlquiler(id: '4', marcaModelo: 'Renault Kwid', placa: 'MN-012-OP', capacidadPasajeros: 4, aireAcondicionado: false)
  ];

  void toggleFavorito(String id) {
    state = state.map((a) =>
        a.id == id
          ? AutoAlquiler(id: a.id, marcaModelo: a.marcaModelo, placa: a.placa,
                        capacidadPasajeros: a.capacidadPasajeros, aireAcondicionado: a.aireAcondicionado,
                        favorito: !a.favorito)
          : a
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((a) => a.id != id).toList();
  }

  void agregar(AutoAlquiler auto) {
    state = [...state, auto];
  }
}

final autosProvider =
    NotifierProvider<AutosNotifier, List<AutoAlquiler>>(
  AutosNotifier.new,
);

// Filtro de búsqueda — estado primitivo
final busquedaAutosProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final autosFiltradosProvider = Provider<List<AutoAlquiler>>((ref) {
  final todos    = ref.watch(autosProvider);
  final busqueda = ref.watch(busquedaAutosProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((a) =>
      a.marcaModelo.toLowerCase().contains(q) || a.placa.toLowerCase().contains(q)
  ).toList();
  // Cuando 'autosProvider' o 'busquedaAutosProvider' cambian,
  // este provider se recalcula automáticamente.
});