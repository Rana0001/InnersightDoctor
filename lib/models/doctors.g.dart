// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      fullName: json['fullName'] as String? ?? "",
      email: json['email'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      profileURl: json['profileURl'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      speciality: json['speciality'] as String? ?? "",
      experience: json['experience'] as String? ?? "",
      qualification: json['qualification'] as String? ?? "",
      certificate: json['certificate'] as String? ?? "",
      price: json['price'] as String? ?? "",
      hospital: json['hospital'] as String?,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'fullName': instance.fullName ?? "",
      'email': instance.email ?? "",
      'phone': instance.phone ?? "",
      'profileURl': instance.profileURl ?? "",
      'uid': instance.uid ?? "",
      'speciality': instance.speciality ?? "",
      'experience': instance.experience ?? "",
      'qualification': instance.qualification ?? "",
      'certificate': instance.certificate ?? "",
      'price': instance.price ?? "",
      'hospital': instance.hospital ?? "",
    };
