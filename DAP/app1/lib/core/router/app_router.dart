import 'package:app1/presentation/screens/homescreen.dart';
import 'package:app1/presentation/screens/loginscreen.dart';
import 'package:app1/presentation/screens/lista.dart';
import 'package:app1/presentation/screens/registerscreen.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/presentation/screens/details.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final extra = (state.extra is Map<String, String>) ? state.extra as Map<String, String> : <String, String>{};
        final username = extra['username'] ?? '';
        final title = extra['title'] ?? '';
        final photo = extra['photo'] ?? '';
        final description = extra['description'] ?? '';
        return HomeScreen(username: username, title: title, photo: photo, description: description);
      },
    ),
    GoRoute(
  path: '/Lista',
  builder: (context, state) {
    final extra = (state.extra is Map<String, String>) ? state.extra as Map<String, String> : <String, String>{};
    final cambio = extra['cambio'] == 'true';
    final index = extra['index'] != null ? int.tryParse(extra['index'] ?? '') : null;
    final username = extra['username'] ?? '';
    return Lista(title: '', photo: '', description: '', cambio: cambio, index: index, username: username);
  },
),
    GoRoute(path: '/register', 
    builder: (context, state){ 
      
      return RegisterScreen();
    },
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final extra = (state.extra is Map<String, String>) ? state.extra as Map<String, String> : <String, String>{};
        final title = extra['title'] ?? '';
        final photo = extra['photo'] ?? '';
        final description = extra['description'] ?? '';
        final index = extra['index'] != null ? int.tryParse(extra['index'] ?? '') : null;
        final username = extra['username'] ?? '';
        return DetailScreen(title: title, photo: photo, description: description, index: index ?? 0, username: username);
      },
    ),
  ],
);