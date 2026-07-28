import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer? _timer;    
  int  _segundos = 0;
  bool _pausado  = false;
  final List<int> _tiemposParada = []; 

  @override
  void initState() {
    super.initState();    
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;   
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer?.cancel();      
      } else {
        _iniciarTimer();      
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();          
    super.dispose();          
  }

  String _formatearTiempo(int totalSegundos) {
    final h = totalSegundos ~/ 3600;
    final m = (totalSegundos % 3600) ~/ 60;
    final s = totalSegundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get _formato {
    return _formatearTiempo(_segundos);
  }

  Color get _colorTiempo {
    if (_segundos > 120) return Colors.deepPurple;
    if (_segundos > 60) return Colors.red;
    if (_segundos > 30) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Tiempo de Prueba de Manejo',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
        ),
        const SizedBox(height: 8),
        Text(
          _formato,
          style: TextStyle(
            fontSize:   40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color:      _colorTiempo,         
          ),
        ),
        const SizedBox(height: 16),
        Wrap( 
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon:  Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar Ruta' : 'Pausar Ruta'),
            ),
            FilledButton.icon(
              onPressed: _pausado ? null : () => setState(() {
                _tiemposParada.add(_segundos);
              }),
              icon: const Icon(Icons.location_on),
              label: const Text('Registrar Parada'),
            ),
            TextButton.icon(
              onPressed: () => setState(() {
                _timer?.cancel();
                _segundos = 0;
                _pausado  = false;
                _tiemposParada.clear();
                _iniciarTimer();
              }),
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar Prueba'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Vehículo Detenido' : 'Vehículo en Ruta',
          style: TextStyle(
            fontSize: 14, 
            color: _pausado ? Colors.redAccent : Colors.green,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 16),
        if (_tiemposParada.isNotEmpty)
          Text(
            'Última parada registrada a los: ${_formatearTiempo(_tiemposParada.last)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
      ],
    );
  }
}