import 'package:go_router/go_router.dart';
import 'package:empleo_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/landing',
      builder: (context, state) => const LandingPageScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: '/recuperar-password',
      builder: (context, state) => const RecuperarPassword(),
    ),

    GoRoute(
      path: '/loading',
      builder: (context, state) => const LoadingScreen(),
    ),

  ]
);