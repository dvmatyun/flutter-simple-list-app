import 'package:eleven_system_test/features/contacts/data/repositories/contacts_repository.dart';
import 'package:eleven_system_test/features/contacts/presentation/bloc/contacts_list_bloc.dart';
import 'package:eleven_system_test/features/contacts/presentation/screens/contact_edit_screen.dart';
import 'package:eleven_system_test/features/contacts/presentation/widgets/contacts_list.dart';
import 'package:eleven_system_test/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// {@template contacts_screen}
/// ContactsScreen widget
/// {@endtemplate}
class ContactsScreen extends StatefulWidget {
  /// {@macro contacts_screen}
  const ContactsScreen({super.key});

  static const String routeName = '/contacts';

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

/// State for widget ContactsScreen
class _ContactsScreenState extends State<ContactsScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(ContactsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsListBloc>(
      create: (context) => ContactsListBloc(
        contactsRepo: singletonContactsRepo,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts Screen'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Go to Home Screen'),
                ElevatedButton(
                  onPressed: () {
                    context.go(HomeScreen.routeName);
                  },
                  child: const Text('Home'),
                ),
                const Expanded(
                  child: ContactsList(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const _AddContactButton(),
      ),
    );
  }
}

/// {@template contacts_screen}
/// _AddContactButton widget
/// {@endtemplate}
class _AddContactButton extends StatelessWidget {
  /// {@macro contacts_screen}
  const _AddContactButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute(
            builder: (_) => ContactEditScreen(
              bloc: BlocProvider.of<ContactsListBloc>(context, listen: false),
              contact: null,
            ),
          ),
        );
      },
      label: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add contact'),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
