import 'package:flutter/material.dart';

class ServicioEstado extends StatefulWidget {
  final String nombre;
  const ServicioEstado({super.key, required this.nombre});

  @override
  State<ServicioEstado> createState() => _ServicioEstadoState();
}

class _ServicioEstadoState extends State<ServicioEstado> {
  bool _activo    = true;
  int  _reportesDanos = 0;

  // Límite de reportes antes de necesitar inspección mayor
  static const int _maxReportesDanos = 1;

  String nivel = 'normal';

  void _actualizarNivel() {
    if (_reportesDanos >= 2) {
      nivel = 'critico';
    } else if (_reportesDanos >= 1) {
      nivel = 'warning';
    } else {
      nivel = 'normal';
    }
  }

  // Lógica para definir el color del ícono según el estado
  Color _obtenerColorIcono() {
    if (!_activo) return Colors.red; 
    if (nivel == 'critico') return Colors.purple; 
    if (nivel == 'warning') return Colors.orange; 
    return Colors.green; 
  }

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (_activo) _reportesDanos++;
      _actualizarNivel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reportesDanos >= _maxReportesDanos;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            _activo ? Icons.car_rental : Icons.car_repair,
            size:  72,
            color: _obtenerColorIcono(),
          ),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          Text(
            _activo ? 'Disponible para renta' : 'En taller / Mantenimiento',
            style: TextStyle(
              fontSize:   15,
              fontWeight: FontWeight.w600,
              fontStyle:  _activo ? FontStyle.normal : FontStyle.italic,
              color:      _activo ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),

          if (!_activo)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: Colors.red.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text('Vehículo requiere inspección',
                      style: TextStyle(color: Colors.red, fontSize: 13)),
                ],
              ),
            ),

          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_activo ? Icons.build : Icons.check_circle),
            label: Text(_activo ? 'Enviar a Mantenimiento' : 'Dar de Alta'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _activo ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),

          Opacity(
            opacity: enLimite ? 0.1 : 1.0,
            child: Text(
              'Reportes de daños: $_reportesDanos / $_maxReportesDanos ($nivel)',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reportes de daño alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),
          
          const SizedBox(height: 16),

          TextButton(
            onPressed: () {
              setState(() {
                _activo = true;
                _reportesDanos = 0;
                nivel = 'normal';
              });
            },
            child: const Text('Reiniciar Estado (Reparación Completa)'),
          ),
        ],
      ),
    );
  }
}