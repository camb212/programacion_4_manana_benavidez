// lib/router/app_router_paso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_autos.dart';
import '../screens/pantalla_detalle.dart';
import '../models/auto_modelo.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/autos',
      builder: (context, state) => const PantallaAutos(),
      routes: [
        // Ruta hija: /autos/:id
        GoRoute(
          path:    ':id',   // relativa — ruta completa: /autos/:id
          builder: (context, state) {
            final id   = state.pathParameters['id']!;
            final auto = state.extra as AutoAlquiler?;
            return PantallaDetalle(id: id, auto: auto);
          },
        ),
        // Ruta hija: /autos/:id/logs (o historial de alquiler)
        GoRoute(
          path:    ':id/logs',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Historial de $id')),
              body:   Center(child: Text('Historial del auto $id')),
            );
          },
        ),
      ],
    ),
  ],
);