import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Flota (Renta)')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'SUV-Toyota-RAV4: Alquilado',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // .w100–.w900  ·  .bold = .w700
              color: Colors.redAccent,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal, // .italic
              decoration: TextDecoration.lineThrough,
              shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]
              //             .underline  .lineThrough  .overline
            ),
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Agencia Centro - Terminal Internacional → Sin vehículos disponibles en esta categoría por el momento',
              textAlign:
                  TextAlign.justify, // .left  .right  .justify  .start  .end
              maxLines: 2,
              overflow: TextOverflow.fade, 
              softWrap: false // .clip  .fade  .visible
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado del contrato: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'VENCIDO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — retraso en devolución de 2 horas',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── SelectableText — el usuario puede seleccionar y copiar ───────────
          const SelectableText(
            'Placa asignada: RNT-9081',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // ── Íconos adaptados a vehículos ───────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.check_circle, size: 80, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.car_crash, size: 80, color: Colors.red),
              const Icon(Icons.car_rental, size: 80, color: Colors.orange),
              const Icon(Icons.directions_car, size: 14, color: Colors.indigo),
              const Icon(Icons.vpn_key_off, size: 14, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Ajustes de Reserva',
          ), // leído por lectores de pantalla
          const Divider(height: 32),

          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              const ElevatedButton(onPressed: null, child: Text('Auto No Disponible')),
              //             ↑ onPressed: null → desactiva el botón visualmente
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.support_agent, size: 18),
                label: const Text('Llamar a la agencia'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cancel_schedule_send, size: 18),
                label: const Text('Cancelar reserva'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.local_gas_station),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Buscar gasolineras cercanas'
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600, // Cambiado a verde para "Reservar"
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 0,
            ),
            child: const Text(
              'Confirmar Alquiler',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          // ── Tarjetas adaptadas a modelos de autos ──────────────────────────────
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.blue.shade50, // Ajustado a un color más amigable
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              leading: const Icon(Icons.directions_car, color: Colors.indigo),
              title: const Text('Ford Explorer 2024'),
              subtitle: const Text('Vehículo SUV espacioso ideal para viajes familiares. Incluye kilometraje ilimitado y seguro básico contra terceros.'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              isThreeLine: true,
              onTap: () {}, // toda la fila queda tocable
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: const Icon(Icons.build, color: Colors.orange, size: 20),
              ),
              title: const Text('Hyundai Tucson'),
              subtitle: const Text('en mantenimiento · Agencia Sur'),
              trailing: TextButton(onPressed: () {}, child: const Text('Cambiar')),
            ),
          ),
          const Divider(height: 32),
          
          // ── Switches para extras del alquiler ──────────────────────────────────
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Seguro a todo riesgo (Premium)'),
              subtitle: const Text('Cobertura completa sin deducible'),
            ),
          ),
          const Divider(height: 32),

          // ── Chips para categorías y filtros de autos ───────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('Económico')),
              const Chip(label: Text('Sedán')),
              const Chip(label: Text('SUV')),
              const Chip(label: Text('Lujo')),
              const Chip(
                avatar: Icon(Icons.settings_suggest, size: 16, color: Colors.white),
                label: Text('Automático'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                onDeleted: () {},
                deleteIcon: const Icon(Icons.close, size: 16),
                label: const Text('Silla de bebé'),
                selected: true,
                onSelected: (_) {},
                padding: const EdgeInsets.all(8),
              ),
              ActionChip(
                label: const Text('Ver contrato'),
                avatar: const Icon(Icons.description, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // ── Circular (Se mantiene igual, útil para cargas) ───────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator()),           // value: null → animación continua
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       null,           
                  color:       Colors.green,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade200, 
                )),
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       0.3,
                  color:       Colors.red,
                  strokeWidth: 3,
                  strokeCap:   StrokeCap.round,   // puntas redondeadas
                  backgroundColor: Colors.grey.shade200, 
                )),
              Transform.scale(
                scale: 0.5,
                child: const SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal (Se mantiene igual, útil para progreso de reserva) ────────
          const LinearProgressIndicator(),                                  // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null, color: Colors.indigo), 
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value:     1.0,
            color:     Colors.green,
            minHeight: 12,                     
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}