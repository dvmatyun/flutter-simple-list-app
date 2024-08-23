// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:eleven_system_test/features/contacts/domain/entities/contact_entity.dart';
import 'package:eleven_system_test/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contacts_list_event.dart';
part 'contacts_list_state.dart';

class ContactsListBloc extends Bloc<ContactsListEvent, ContactsListState> {
  ContactsListBloc({
    required IContactsRepositoty contactsRepo,
  })  : _contactsRepo = contactsRepo,
        super(
          const ContactsListState(
            isLoading: true,
          ),
        ) {
    on<ContactsListDroppableEvent>(
      (event, emit) {
        switch (event) {
          case final ContactsListRequestEvent req:
            return _onListRequested(req, emit);
        }
      },
      transformer: droppable(),
    );

    on<ContactsListSequationalEvent>(
      (event, emit) {
        switch (event) {
          case final ContactsListInitialEvent initial:
            return _onInitial(initial, emit);
          case final ContactsListCreateEvent create:
            return _onCreate(create, emit);
          case final ContactsListUpdateEvent update:
            return _onUpdate(update, emit);
          case final ContactsListGetByIdEvent getById:
            return _onGetById(getById, emit);
          case final ContactsListDeleteEvent delete:
            return _onDeleteById(delete, emit);
        }
      },
      transformer: sequential(),
    );

    add(const ContactsListInitialEvent());
  }

  final IContactsRepositoty _contactsRepo;

  Future<void> _onInitial(
    ContactsListInitialEvent event,
    Emitter<ContactsListState> emit,
  ) async {
    await _contactsRepo.init();
    add(const ContactsListRequestEvent());
  }

  Future<void> _onListRequested(
    ContactsListRequestEvent event,
    Emitter<ContactsListState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final contacts = await _contactsRepo.getList();
      emit(state.copyWith(contacts: contacts));
      // Errors can be handled in the catch block and displayed in UI
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  Future<void> _onCreate(
    ContactsListCreateEvent event,
    Emitter<ContactsListState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final contact = await _contactsRepo.add(event.contact);
      emit(state.copyWith(
        contacts: [contact, ...?state.contacts],
        actionTypeDone: ActionTypeDone.added,
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onUpdate(
    ContactsListUpdateEvent event,
    Emitter<ContactsListState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final contact = await _contactsRepo.update(event.contact);
      emit(state.copyWith(
        contacts: [
          contact,
          ...?state.contacts?.where((e) => e.contactId != contact.contactId),
        ],
        actionTypeDone: ActionTypeDone.updated,
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onGetById(
    ContactsListGetByIdEvent event,
    Emitter<ContactsListState> emit,
  ) async {
    // This event can be used when viewing a single contact and
    // we want to refresh the data from the server for example
    try {
      emit(state.copyWith(isLoading: true));
      final contact = await _contactsRepo.getById(event.contactId);
      emit(state.copyWith(selectedContact: contact));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onDeleteById(
    ContactsListDeleteEvent event,
    Emitter<ContactsListState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _contactsRepo.delete(event.contactId);
      emit(
        state.copyWith(
          contacts: [
            ...?state.contacts?.where((e) => e.contactId != event.contactId),
          ],
          actionTypeDone: ActionTypeDone.removed,
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
