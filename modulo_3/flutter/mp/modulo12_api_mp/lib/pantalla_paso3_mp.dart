import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'auto_mp.dart';
import 'auto_dto_mp.dart';

class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<Auto>> _fetchAutos() async {
    final res = await http.get(
      Uri.parse(
          'https://api.escuelajs.co/api/v1/products?limit=20&offset=0'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => AutoDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · API real (Catálogo)'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<Auto>>(
        future: _fetchAutos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final autos = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: autos.length,
            itemBuilder: (context, i) {
              final auto = autos[i];
              
              // Corregido: usa 'auto.activo' en lugar de 'auto.disponible'
              final estaDisponible = auto.activo; 

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        estaDisponible ? Colors.green[100] : Colors.grey[200],
                    child: Text(
                      auto.id.toString(),
                      style: TextStyle(
                        color: estaDisponible ? Colors.green[800] : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text(auto.nombre),
                  subtitle: Text(auto.categoria ?? 'Sin categoría'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${auto.precio.toStringAsFixed(2)} / día',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        estaDisponible ? 'Disponible' : 'Alquilado',
                        style: TextStyle(
                          color: estaDisponible ? Colors.green : Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}