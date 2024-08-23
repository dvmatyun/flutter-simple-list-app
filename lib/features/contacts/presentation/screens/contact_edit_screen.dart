import 'package:eleven_system_test/features/contacts/data/models/contact_dto.dart';
import 'package:eleven_system_test/features/contacts/domain/entities/contact_entity.dart';
import 'package:eleven_system_test/features/contacts/presentation/bloc/contacts_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// {@template contact_edit_screen}
/// ContactEditScreen widget. This screen is ephemeral, so it is not included in the app_router.
/// {@endtemplate}
class ContactEditScreen extends StatefulWidget {
  /// {@macro contact_edit_screen}
  const ContactEditScreen({required this.bloc, required this.contact, super.key});
  final ContactsListBloc bloc;
  final IContactEntity? contact;

  @override
  State<ContactEditScreen> createState() => _ContactEditScreenState();
}

/// State for widget ContactEditScreen
class _ContactEditScreenState extends State<ContactEditScreen> {
  late final contact = widget.contact;
  final firstNameTe = TextEditingController();
  final lastnameTe = TextEditingController();
  final streetAddress1Te = TextEditingController();
  final streetAddress2Te = TextEditingController();
  // Other controllers can be added as well

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
    _initFields();
  }

  void _initFields() {
    final contact = widget.contact;
    if (contact == null) {
      return;
    }

    firstNameTe.text = contact.firstName ?? '';
    lastnameTe.text = contact.lastName ?? '';
    streetAddress1Te.text = contact.streetAddress1 ?? '';
    streetAddress2Te.text = contact.streetAddress2 ?? '';
  }

  @override
  void didUpdateWidget(ContactEditScreen oldWidget) {
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
    return Scaffold(
      appBar: AppBar(
        title: contact == null ? const Text('Contact add Screen') : const Text('Contact edit Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('First name'),
                TextField(
                  controller: firstNameTe,
                ),
                const Text('Last name'),
                TextField(
                  controller: lastnameTe,
                ),
                const Text('Address 1'),
                TextField(
                  controller: streetAddress1Te,
                ),
                const Text('Address 2'),
                TextField(
                  controller: streetAddress2Te,
                ),
                TextButton(
                  onPressed: () {
                    if (contact == null) {
                      widget.bloc.add(
                        ContactsListCreateEvent(
                          // Here im using DTO just to save time.
                          // Entity can be created in domain layer and passed here
                          ContactDto(
                            contactId: const Uuid().v4(),
                            firstName: firstNameTe.text,
                            lastName: lastnameTe.text,
                            streetAddress1: streetAddress1Te.text,
                            streetAddress2: streetAddress2Te.text,
                          ),
                        ),
                      );
                    } else {
                      widget.bloc.add(
                        ContactsListUpdateEvent(
                          contact!.copyWith(
                            firstName: firstNameTe.text,
                            lastName: lastnameTe.text,
                            streetAddress1: streetAddress1Te.text,
                            streetAddress2: streetAddress2Te.text,
                          ),
                        ),
                      );
                    }
                    Navigator.of(context).pop();
                  },
                  child: contact == null ? const Text('Add') : const Text('Update'),
                ),
                if (contact != null)
                  TextButton(
                    onPressed: () {
                      widget.bloc.add(ContactsListDeleteEvent(contact!.contactId));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Delete'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
