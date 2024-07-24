import 'package:go_router/go_router.dart';
import 'package:empleo_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/landing',
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
      builder: (context, state) => const LoadingLoginScreen(),
    ),

    GoRoute(
      path: '/administracion',
      builder: (context, state) => const AdminScreen(),
    ),

    GoRoute(
      path: '/crud-user',
      builder: (context, state) => const CrudUsuarioScreen(),
    ),

    GoRoute(
      path: '/crud-tp-user',
      builder: (context, state) => const  CrudTpUsuarioScreen(),
    ),
    GoRoute(
      path: '/crud-provincia',
      builder: (context, state) => const  CrudProvinciaScreen(),
    ),

  ]
);