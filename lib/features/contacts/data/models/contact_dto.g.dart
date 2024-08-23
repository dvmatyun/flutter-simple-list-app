// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDto _$ContactDtoFromJson(Map<String, dynamic> json) => ContactDto(
      id: (json['id'] as num).toInt(),
      contactId: json['contact_id'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      streetAddress1: json['street_address1'] as String?,
      streetAddress2: json['street_address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipCode: json['zip_code'] as String?,
    );

Map<String, dynamic> _$ContactDtoToJson(ContactDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'contact_id': instance.contactId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('street_address1', instance.streetAddress1);
  writeNotNull('street_address2', instance.streetAddress2);
  writeNotNull('city', instance.city);
  writeNotNull('state', instance.state);
  writeNotNull('zip_code', instance.zipCode);
  return val;
}
