import 'package:eleven_system_test/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:eleven_system_test/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouterConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: HomeScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: ContactsScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const ContactsScreen();
      },
    ),
  ],
);
