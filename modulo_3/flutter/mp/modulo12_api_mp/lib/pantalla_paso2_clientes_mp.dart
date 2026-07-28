import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modulo12_api_mp/cliente_dto_mp.dart';

import 'cliente_dto_mp.dart'; // Adaptado

class PantallaPaso2Clientes extends StatelessWidget { // Adaptado
  const PantallaPaso2Clientes({super.key});

  Future<List<ClienteDto>> _fetchClientes() async { // Adaptado
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => ClienteDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO clientes'), // Adaptado
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<ClienteDto>>( // Adaptado
        future: _fetchClientes(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final clientes = snap.data!; // Adaptado
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text('${clientes.length} clientes'), // Adaptado
                      backgroundColor: Colors.blue[100],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (context, i) {
                    final cliente = clientes[i]; // Adaptado
                    return ListTile(
                      title: Text(cliente.name),
                      subtitle: Text(cliente.email),
                      leading: CircleAvatar(
                        child: Text(cliente.id.toString()),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}