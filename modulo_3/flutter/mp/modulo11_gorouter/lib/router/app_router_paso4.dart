// lib/router/app_router_paso4.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter/screens/pantalla_dashboard.dart';
import 'package:modulo11_gorouter/screens/scaffold_con_nav.dart';
import '../screens/pantalla_autos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/auto_modelo.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/autos',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute — mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/autos',
          builder: (_, __) => const PantallaAutos(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id   = state.pathParameters['id']!;
                final auto = state.extra as AutoAlquiler?;
                return PantallaDetalle(id: id, auto: auto);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (_, __) => const PantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
        GoRoute(
          path:    '/dashboard',
          builder: (_, __) => const PantallaDashboard(),
        ),
      ],
    ),
  ],
);