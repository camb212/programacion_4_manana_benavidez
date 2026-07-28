// lib/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_autos.dart'; // <-- Actualizado

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      name:    'inicio',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/autos', // <-- Actualizado
      name:    'autos',
      builder: (context, state) => const PantallaAutos(), // <-- Actualizado
    ),
  ],
);