import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class PantallaPaso1Clientes extends StatelessWidget {
  const PantallaPaso1Clientes({super.key});

  Future<Map<String, dynamic>> _fetchCliente() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 1 · FutureBuilder crudo'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchCliente(),
          builder: (context, snap) {
            
            if (snap.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
          
            if (snap.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_off, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text('Error: ${snap.error}',
                      style: const TextStyle(color: Colors.red)),
                ],
              );
            }
            
            final cliente = snap.data!;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 48, color: Colors.green),
                  const SizedBox(height: 16),
                  
                  Text('Nombre: ${cliente['name']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 8),
                  
                  Text(
                    cliente['email'] as String,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text(cliente['website']),
                    backgroundColor: (cliente['website'] as String).isNotEmpty
                        ? Colors.green[100]
                        : Colors.orange[100],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}