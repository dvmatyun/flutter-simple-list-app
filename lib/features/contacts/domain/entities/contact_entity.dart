abstract class IContactEntity {
  int get id;
  String get contactId;
  String? get firstName;
  String? get lastName;
  String? get phoneNumber;
  String? get streetAddress1;
  String? get streetAddress2;
  String? get city;
  String? get state;
  String? get zipCode;


  IContactEntity copyWith({
    int? id,
    String? contactId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? streetAddress1,
    String? streetAddress2,
    String? city,
    String? state,
    String? zipCode,
  });
}
