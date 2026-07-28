import 'package:flutter/material.dart';

class CustomizedSizedBox extends StatelessWidget {
  
  const CustomizedSizedBox({
    super.key, 
    required this.height, 
    required this.width, 
    required MainAxisAlignment mainAxisAlignment, 
    required List<Widget> children,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SizedBox — espaciado fijo
          const Text('Configuración de Tarifa', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Tarifa base por día'),
          const SizedBox(height: 32),          // ← espacio fijo de 32px
          const Text('Tarifa final (incluye seguro y accesorios)'),

          const Divider(height: 32),

          // Padding — espacio alrededor de un hijo
          const Text('Detalles de Reserva', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            color: Colors.indigo.shade50,
            child: const Padding(
              padding: EdgeInsets.only(left: 24),    // ← sangría izquierda
              child:   Text('Vehículo reservado con kilometraje libre'),
            ),
          ),

          const Divider(height: 32),

          // Align — posicionar dentro del espacio disponible
          const Text('Estado del Contrato', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,        // ← alineado a la derecha
            child: Icon(Icons.car_rental, color: Colors.indigo),
          ),

          const Divider(height: 32),

          // Wrap — flujo automático de elementos (Extras y Características del Auto)
          const Text('Extras y Equipamiento', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['SUV', 'Automático', 'A/C', 'GPS', 'Silla de bebé', 'Seguro Total', 'Con chofer']
                .map((t) => Chip(label: Text(t)))
                .toList(),
          ),
        ],
      );
  }
}