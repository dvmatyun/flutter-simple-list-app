part of 'contacts_list_bloc.dart';

abstract class ContactsListEvent {
  const ContactsListEvent();
}

abstract class ContactsListSequationalEvent extends ContactsListEvent {
  const ContactsListSequationalEvent();
}

abstract class ContactsListDroppableEvent extends ContactsListEvent {
  const ContactsListDroppableEvent();
}

// droppable events:
class ContactsListRequestEvent extends ContactsListDroppableEvent {
  const ContactsListRequestEvent();
}

// sequential events
class ContactsListInitialEvent extends ContactsListSequationalEvent {
  const ContactsListInitialEvent();
}

class ContactsListCreateEvent extends ContactsListSequationalEvent {
  const ContactsListCreateEvent(this.contact);

  final IContactEntity contact;
}

class ContactsListUpdateEvent extends ContactsListSequationalEvent {
  const ContactsListUpdateEvent(this.contact);
  
  final IContactEntity contact;
}

class ContactsListDeleteEvent extends ContactsListSequationalEvent {
  const ContactsListDeleteEvent(this.contactId);
  
  final String contactId;
}

class ContactsListGetByIdEvent extends ContactsListSequationalEvent {
  const ContactsListGetByIdEvent(this.contactId);
  
  final String contactId;
}