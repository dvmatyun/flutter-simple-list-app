import 'package:eleven_system_test/features/contacts/domain/entities/contact_entity.dart';

abstract class IContactsRepositoty {
  Future<void> init();
  Future<List<IContactEntity>> getList();
  Future<IContactEntity?> getById(String contactId);
  Future<IContactEntity> add(IContactEntity contact);
  Future<IContactEntity> update(IContactEntity contact);
  Future<void> delete(String contactId);
}
