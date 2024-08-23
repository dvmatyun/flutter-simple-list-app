import 'dart:convert';

import 'package:eleven_system_test/features/app/logger.dart';
import 'package:eleven_system_test/features/contacts/data/models/contact_dto.dart';
import 'package:eleven_system_test/features/contacts/domain/entities/contact_entity.dart';
import 'package:eleven_system_test/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:eleven_system_test/objectbox.g.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

final singletonContactsRepo = ContactsRepositoty.construct();

class ContactsRepositoty implements IContactsRepositoty {
  ContactsRepositoty();

  factory ContactsRepositoty.construct() {
    return ContactsRepositoty();
  }

  Store? _store;
  bool _initted = false;

  // Putting the initial data in store
  @override
  Future<void> init() async {
    if (_initted) {
      return;
    }
    _initted = true;
    final json = await rootBundle.loadString('assets/contacts_init.json');
    final decoded = jsonDecode(json) as List<dynamic>;
    final contacts = decoded.map((e) => ContactDto.fromJson(e as Map<String, dynamic>)).toList();

    final store = await _getBox();
    await store.removeAllAsync(); // Clearing the store to reset the data
    await store.putManyAsync(contacts);
    l.v('Initial Contacts (${contacts.length} items) inserted');
  }

  Future<Box<ContactDto>> _getBox() async {
    //final Directory tempDir = await getTemporaryDirectory();
    final store = _store ??= await _getStore();
    final box = store.box<ContactDto>();
    return box;
  }

  Future<Store> _getStore() async {
    final tempDir = await getTemporaryDirectory();
    return openStore(
      directory: '${tempDir.path}/contacts',
    );
  }

  ContactDto _toDto(IContactEntity contact) {
    return ContactDto(
      id: contact.id,
      contactId: contact.contactId,
      firstName: contact.firstName,
      lastName: contact.lastName,
      phoneNumber: contact.phoneNumber,
      streetAddress1: contact.streetAddress1,
      streetAddress2: contact.streetAddress2,
      city: contact.city,
      state: contact.state,
      zipCode: contact.zipCode,
    );
  }

  @override
  Future<IContactEntity> add(IContactEntity contact) async => (await _getBox()).putAndGetAsync(_toDto(contact));

  @override
  Future<void> delete(String contactId) async {
    final value = await getById(contactId);
    if (value == null) {
      return;
    }
    await (await _getBox()).removeAsync(value.id);
  }

  @override
  Future<IContactEntity?> getById(String contactId) async {
    final query = (await _getBox()).query(ContactDto_.contactId.equals(contactId)).build();
    final result = await query.findFirstAsync();
    return result;
  }

  @override
  Future<List<IContactEntity>> getList() async => (await _getBox()).getAllAsync();

  @override
  Future<IContactEntity> update(IContactEntity contact) => add(contact);
}
