import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── TEXT BÁSICO ───────────────────────────────────────────────────────
          const Text(
            'nginx-proxy: En línea',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── TEXTO CON OVERFLOW ───────────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east → sin respuesta',
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          ),

          const SizedBox(height: 8),

          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'CRÍTICO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última revisión hace 5 min',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          const SelectableText(
            '10.0.0.12:5432',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),

          const Divider(height: 32),

          // ── ICONOS ───────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.check_circle,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Icon(Icons.cancel, size: 40, color: Colors.red),
              const Icon(Icons.warning_amber, size: 80, color: Colors.orange),
              const Icon(Icons.dns, size: 40, color: Colors.indigo),
              const Icon(Icons.wifi_off, size: 14, color: Colors.grey),
              const Tooltip(
                message: 'Servidor activo',
                child: Icon(
                  Icons.check_circle_outline,
                  size: 40,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ),

          const Divider(height: 32),

          // ── BOTONES ───────────────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('FilledButton'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('TextButton'),
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('Desactivado'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Detiene todos los servicios',
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 18),
                label: const Text('Editar'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Descargar'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 14,
              ),
              shape: const StadiumBorder(),
              elevation: 12,
            ),
            child: const Text(
              'Acción crítica',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(height: 32),

          // ── CHIPS AVANZADOS ────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                label: const Text('nginx'),
                padding: const EdgeInsets.all(8),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () {},
              ),
              Chip(
                avatar: const Icon(Icons.check, size: 16, color: Colors.white),
                label: const Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                padding: const EdgeInsets.all(8),
              ),
              FilterChip(
                label: const Text('HTTP/2'),
                selected: false,
                onSelected: (_) {},
              ),
              ActionChip(
                label: const Text('Ver logs'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
              InputChip(
                avatar: const Icon(Icons.dns, size: 16),
                label: const Text('database'),
                selected: true,
                onSelected: (_) {},
                onDeleted: () {},
                deleteIcon: const Icon(Icons.close, size: 16),
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── CIRCULAR PROGRESS ────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(), // value: null → animación continua
              ),
              // MODIFICADO: value pasa a null y se agrega backgroundColor
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: null, // Pasa a animación continua
                  backgroundColor: Colors.grey.shade200, // Pista ahora visible
                  color: Colors.green,
                  strokeWidth: 6,
                ),
              ),
              // MODIFICADO: Envuelto en Transform.scale para reducir tamaño al 50% sin alterar el strokeWidth original
              SizedBox(
                width: 48,
                height: 48,
                child: Transform.scale(
                  scale: 0.5, // Escala sin cambiar strokeWidth
                  child: const CircularProgressIndicator(
                    value: 0.3,
                    color: Colors.red,
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ── LINEAL PROGRESS ──────────────────────────────────────────────────
          const LinearProgressIndicator(), // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.6, color: Colors.indigo), // 60 %
          const SizedBox(height: 8),
          // MODIFICADO: minHeight cambia de 6 a 12
          const LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 12, // Barra sustancialmente más gruesa
          ),

          const Divider(height: 32),

          // ── CARDS ────────────────────────────────────────────────────────────
          Card(
            elevation: 0,
            color: Colors.red.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              isThreeLine: true,
              leading: const Icon(Icons.dns, color: Colors.indigo),
              title: const Text('nginx-proxy'),
              subtitle: const Text(
                '10.0.0.5 · 45ms · Servicio estable en producción con latencia normal y sin errores detectados',
              ),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 8),

          Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: const Icon(Icons.cancel, color: Colors.white, size: 20),
              ),
              title: const Text('backup-worker'),
              subtitle: const Text(
                'sin respuesta · 10.0.0.30 · Servicio caído y requiere intervención inmediata del equipo',
              ),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Ver'),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo mantenimiento'),
              subtitle: const Text(
                'Activa el modo mantenimiento para detener tráfico hacia este servicio',
              ),
            ),
          ),
        ],
      ),
    );
  }
}