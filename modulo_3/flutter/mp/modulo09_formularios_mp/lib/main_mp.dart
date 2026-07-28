// lib/main_auto.dart
import 'package:flutter/material.dart';
import 'models/auto_modelo.dart';
import 'screens/pantalla_autos.dart';
import 'screens/pantalla_busqueda_autos.dart';
import 'widgets/fila_auto.dart';
import 'widgets/formulario_auto.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaAutos(),
    5 => const PantallaBusquedaAutos(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlMarcaModelo = TextEditingController();
  final _ctrlPatente     = TextEditingController();
  final _ctrlPrecio      = TextEditingController(text: '45');
  final _focusPatente    = FocusNode();
  final _focusPrecio     = FocusNode();

  @override
  void dispose() {
    _ctrlMarcaModelo.dispose();
    _ctrlPatente.dispose();
    _ctrlPrecio.dispose();
    _focusPatente.dispose();
    _focusPrecio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:              const Text('Gestión de Alquiler'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlMarcaModelo,
              decoration:      const InputDecoration(
                labelText:  'Marca y Modelo',
                hintText:   'Toyota Corolla 2024',
                prefixIcon: Icon(Icons.directions_car),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusPatente.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlPatente,
              focusNode:       _focusPatente,
              decoration:      const InputDecoration(
                labelText:  'Patente / Placa',
                hintText:   'AB-123-CD',
                prefixIcon: Icon(Icons.confirmation_number),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusPrecio.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:   _ctrlPrecio,
              focusNode:    _focusPrecio,
              decoration:   const InputDecoration(
                labelText:  'Precio por día (\$)',
                prefixIcon: Icon(Icons.attach_money),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando ${_ctrlMarcaModelo.text} '
                      '(Patente: ${_ctrlPatente.text} - \$${_ctrlPrecio.text}/día)',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.car_rental),
              label: const Text('Registrar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlMarcaModelo.clear();
                _ctrlPatente.clear();
                _ctrlPrecio.text = '45';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Paso 2 ────────────────────────────────────────
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:              const Text('Nuevo Auto'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: FormularioAuto(
        onGuardar: (datos) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Auto Guardado: ${datos['nombre']} — Patente ${datos['patente']} (\$${datos['precio']}/día)'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }
}

// ─── Paso 3 ────────────────────────────────────────
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final List<AutoAlquiler> _autos = [
    AutoAlquiler(id: '1', marca: 'Toyota', modelo: 'Corolla 2024', patente: 'AB-123-CD', capacidadPasajeros: 5, transmision: 'Automática', precioPorDia: 45.0, aireAcondicionado: true, favorito: true),
    AutoAlquiler(id: '2', marca: 'Volkswagen', modelo: 'Gol 2023', patente: 'EF-456-GH', capacidadPasajeros: 5, transmision: 'Manual', precioPorDia: 30.0, aireAcondicionado: true),
    AutoAlquiler(id: '3', marca: 'Jeep', modelo: 'Renegade 2024', patente: 'IJ-789-KL', capacidadPasajeros: 5, transmision: 'Automática', precioPorDia: 75.0, aireAcondicionado: false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:              Text('Autos (${_autos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _autos.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.directions_car_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin autos registrados', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _autos.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) {
                final item = _autos[i];
                return FilaAuto(
                  auto: item,
                  onFavorito: () {
                    setState(() {
                      item.favorito = !item.favorito;
                    });
                  },
                  onEliminar: () {
                    setState(() {
                      _autos.removeAt(i);
                    });
                  },
                );
              },
            ),
    );
  }
}