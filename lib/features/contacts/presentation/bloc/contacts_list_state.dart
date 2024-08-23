part of 'contacts_list_bloc.dart';

class ContactsListState {
  const ContactsListState({
    this.contacts,
    this.selectedContact,
    this.isLoading = false,
    this.actionTypeDone,
  }) : super();

  final bool isLoading;
  final IContactEntity? selectedContact;
  final List<IContactEntity>? contacts;
  final ActionTypeDone? actionTypeDone;

  ContactsListState copyWith({
    List<IContactEntity>? contacts,
    IContactEntity? selectedContact,
    ActionTypeDone? actionTypeDone,
    bool? isLoading,
  }) {
    return ContactsListState(
      contacts: contacts ?? this.contacts,
      selectedContact: selectedContact ?? this.selectedContact,
      isLoading: isLoading ?? this.isLoading,
      actionTypeDone: actionTypeDone,
    );
  }
}

enum ActionTypeDone {
  added,
  updated,
  removed,
}