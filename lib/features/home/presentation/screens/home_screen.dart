import 'package:eleven_system_test/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template home_screen}
/// HomeScreen widget
/// {@endtemplate}
class HomeScreen extends StatefulWidget {
  /// {@macro home_screen}
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// State for widget HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Go to Contacts Screen'),
              ElevatedButton(
                onPressed: () {
                  context.go(ContactsScreen.routeName);
                },
                child: const Text('Contacts'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
