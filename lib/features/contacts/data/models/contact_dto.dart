import 'package:eleven_system_test/features/contacts/domain/entities/contact_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
part 'contact_dto.g.dart';

@Entity()
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ContactDto implements IContactEntity {
  ContactDto({
    
    required this.contactId,
    this.id = 0,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.streetAddress1,
    this.streetAddress2,
    this.city,
    this.state,
    this.zipCode,
  });

  factory ContactDto.fromJson(Map<String, dynamic> json) => _$ContactDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ContactDtoToJson(this);

  @override
  @Id()
  int id;

  @override
  @Unique()
  final String contactId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;
  @override
  final String? streetAddress1;
  @override
  final String? streetAddress2;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? zipCode;

  @override
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
  }) {
    return ContactDto(
      id: id ?? this.id,
      contactId: contactId ?? this.contactId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      streetAddress1: streetAddress1 ?? this.streetAddress1,
      streetAddress2: streetAddress2 ?? this.streetAddress2,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
