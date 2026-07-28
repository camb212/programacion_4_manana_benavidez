// lib/widgets/formulario_auto.dart
import 'package:flutter/material.dart';

class FormularioAuto extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioAuto({super.key, required this.onGuardar});

  @override
  State<FormularioAuto> createState() => _FormularioAutoState();
}

class _FormularioAutoState extends State<FormularioAuto> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _ctrlNombre = TextEditingController();
  final _ctrlPatente = TextEditingController();
  final _ctrlPrecio = TextEditingController(text: '45');
  final _ctrlTransmision = TextEditingController(text: 'Automática');
  final _ctrlColor = TextEditingController();

  // FocusNodes para navegación de teclado
  final _focusPatente = FocusNode();
  final _focusPrecio = FocusNode();
  final _focusTransmision = FocusNode();
  final _focusColor = FocusNode();

  // Variables de Estado
  String _modeloAuto = 'Toyota Corolla';
  String _categoria = 'Sedán';
  bool _aireAcondicionado = true;

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlPatente.dispose();
    _ctrlPrecio.dispose();
    _ctrlTransmision.dispose();
    _ctrlColor.dispose();
    _focusPatente.dispose();
    _focusPrecio.dispose();
    _focusTransmision.dispose();
    _focusColor.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre': _ctrlNombre.text.trim(),
      'patente': _ctrlPatente.text.trim(),
      'precio': _ctrlPrecio.text.trim(),
      'transmision': _ctrlTransmision.text.trim(),
      'color': _ctrlColor.text.trim(),
      'modelo': _modeloAuto,
      'categoria': _categoria,
      'aire': _aireAcondicionado.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ── Nombre o Marca/Modelo resumido ───────────────────
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText: 'Nombre o Marca del auto',
              hintText: 'Toyota Corolla 2024',
              prefixIcon: Icon(Icons.directions_car),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPatente.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3) return 'Mínimo 3 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Patente ──────────────────────────────────────────
          TextFormField(
            controller: _ctrlPatente,
            focusNode: _focusPatente,
            decoration: const InputDecoration(
              labelText: 'Patente / Placa',
              hintText: 'AB-123-CD',
              prefixIcon: Icon(Icons.confirmation_number),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPrecio.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'La patente es obligatoria';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Precio por Día ────────────────────────────────────
          TextFormField(
            controller: _ctrlPrecio,
            focusNode: _focusPrecio,
            decoration: const InputDecoration(
              labelText: 'Precio por día (\$)',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusTransmision.requestFocus(),
            validator: (v) {
              final precio = double.tryParse(v ?? '');
              if (precio == null) return 'El precio debe ser un número válido';
              if (precio <= 0) return 'El precio debe ser mayor a 0';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Transmisión ───────────────────────────────────────────
          TextFormField(
            controller: _ctrlTransmision,
            focusNode: _focusTransmision,
            decoration: const InputDecoration(
              labelText: 'Transmisión',
              hintText: 'Automática / Manual',
              prefixIcon: Icon(Icons.settings),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusColor.requestFocus(),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'La transmisión es obligatoria' : null,
          ),
          const SizedBox(height: 12),

          // ── Color / Detalle ──────────────────────────────────────────
          TextFormField(
            controller: _ctrlColor,
            focusNode: _focusColor,
            decoration: const InputDecoration(
              labelText: 'Color del vehículo',
              hintText: 'Blanco, Negro, Plata...',
              prefixIcon: Icon(Icons.color_lens),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El color es obligatorio';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Modelo de Vehículo ──────────────────────────────────────
          DropdownButtonFormField<String>(
            value: _modeloAuto,
            decoration: const InputDecoration(
              labelText: 'Modelo de vehículo',
              prefixIcon: Icon(Icons.directions_car_filled),
              border: OutlineInputBorder(),
            ),
            items: [
              'Toyota Corolla', 'Volkswagen Gol', 'Jeep Renegade',
              'Renault Kwid', 'Chevrolet Cruze',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _modeloAuto = v!),
          ),
          const SizedBox(height: 12),

          // ── Categoría ──────────────────────────────────────────────
          DropdownButtonFormField<String>(
            value: _categoria,
            decoration: const InputDecoration(
              labelText: 'Categoría',
              prefixIcon: Icon(Icons.category),
              border: OutlineInputBorder(),
            ),
            items: [
              'Sedán', 'SUV', 'Compacto', 'Pickup',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _categoria = v!),
          ),
          const SizedBox(height: 8),

          // ── Aire Acondicionado ──────────────────────────────────
          SwitchListTile(
            title: const Text('Aire Acondicionado'),
            subtitle: const Text('Incluye climatización'),
            value: _aireAcondicionado,
            onChanged: (v) => setState(() => _aireAcondicionado = v),
            secondary: const Icon(Icons.ac_unit),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    _ctrlNombre.clear();
                    _ctrlPatente.clear();
                    _ctrlColor.clear();
                    _ctrlPrecio.text = '45';
                    _ctrlTransmision.text = 'Automática';
                  },
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar auto'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}