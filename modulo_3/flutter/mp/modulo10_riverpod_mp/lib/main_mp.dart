// lib/main_mp.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'screens/pantalla_busqueda_autos.dart';
import 'screens/pantalla_dashboard_autos.dart';
import 'screens/pantalla_metricas_autos.dart';
import 'screens/pantalla_autos.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │   Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │   1   Paso 1   ProviderScope + StateProvider básico (contador)    │
// │   2   Paso 2   NotifierProvider + lista de autos                  │
// │   3   Paso 3   Provider derivado + búsqueda filtrada              │
// │   4   Paso 4   AsyncNotifierProvider + métricas loading/error     │
// │   5   Paso 5   NavigationBar con dos tabs usando Riverpod         │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

// StateProvider — estado simple del Paso 1
final contadorProvider = StateProvider<int>((ref) => 5);

void main() {
  runApp(const ProviderScope(child: AppMonitoreo()));
}

class AppMonitoreo extends StatelessWidget {
  const AppMonitoreo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const PantallaAutos(),
        3 => const PantallaBusquedaAutos(),
        4 => const PantallaMetricasAutos(),
        5 => const PantallaDashboardAutos(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

// ─── Paso 1 — vive en main_mp.dart ─────────────────────────────────────────
class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Carros conectados')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('autos activos'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}