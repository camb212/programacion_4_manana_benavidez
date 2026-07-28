// lib/router/app_router_paso3.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter/screens/pantalla_autos_filtrados.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_detalle.dart';
import '../models/auto_modelo.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/autos',
      builder: (context, state) {
        // Query parameters — /autos?soloAire=true
        final soloAire = state.uri.queryParameters['soloAire'] == 'true';
        return PantallaAutosFiltrados(soloAire: soloAire);
      },
    ),
    GoRoute(
      path:    '/autos/:id',
      builder: (context, state) {
        final id   = state.pathParameters['id']!;
        final auto = state.extra as AutoAlquiler?;
        return PantallaDetalle(id: id, auto: auto);
      },
    ),
  ],
);