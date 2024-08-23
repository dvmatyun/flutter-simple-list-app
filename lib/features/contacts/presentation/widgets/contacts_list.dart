import 'package:eleven_system_test/features/contacts/presentation/bloc/contacts_list_bloc.dart';
import 'package:eleven_system_test/features/contacts/presentation/screens/contact_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template contacts_list}
/// ContactsList widget
/// {@endtemplate}
class ContactsList extends StatelessWidget {
  /// {@macro contacts_list}
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsListBloc, ContactsListState>(
      listener: (context, state) {
        final action = state.actionTypeDone;
        if (action == null) {
          return;
        }
        switch (action){
          case ActionTypeDone.added:
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              const SnackBar(
                content: Text('Contact added to the top of the list'),
              ),
            );
            break;
          case ActionTypeDone.updated:
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              const SnackBar(
                content: Text('Contact updated and moved to the top of the list'),
              ),
            );
            break;
          case ActionTypeDone.removed:
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              const SnackBar(
                content: Text('Contact deleted'),
              ),
            );
            break;
        }
      },
      builder: (context, state) {
        final contacts = state.contacts;
        if (contacts == null) {
          return const Align(
            alignment: Alignment.centerLeft,
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, item) {
            return ListTile(
              title: Text(contacts[item].firstName ?? 'No name'),
              subtitle: Text(contacts[item].phoneNumber ?? 'No phone number'),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(
                    builder: (_) => ContactEditScreen(
                      bloc: context.read<ContactsListBloc>(),
                      contact: contacts[item],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
