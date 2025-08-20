import 'dart:convert';

class NurseProfile {
  final bool status;
  final NurseData? data;
  final String? message;

  NurseProfile({
    required this.status,
    this.data,
    this.message,
  });

  factory NurseProfile.fromJson(Map<String, dynamic> json) {
    return NurseProfile(
      status: json['status'] ?? false,
      data: json['data'] != null ? NurseData.fromJson(json['data']) : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class NurseData {
  final int? id;
  final int? nurseId;
  final String? licenseNumber;
  final String? licenseExpiryDate;
  final String? yearsOfExperience;
  final String? specialization;
  final String? bio;
  final String? hourlyRate;
  final List<Map<String, String>> availability;
  final String? adharcard;
  final String? pancard;
  final String? nursingLicense;
  final List<String> certificate;
  final int? isVerified;
  final String? remark;
  final String? createdAt;
  final String? updatedAt;

  NurseData({
    this.id,
    this.nurseId,
    this.licenseNumber,
    this.licenseExpiryDate,
    this.yearsOfExperience,
    this.specialization,
    this.bio,
    this.hourlyRate,
    required this.availability,
    this.adharcard,
    this.pancard,
    this.nursingLicense,
    required this.certificate,
    this.isVerified,
    this.remark,
    this.createdAt,
    this.updatedAt,
  });

  factory NurseData.fromJson(Map<String, dynamic> json) {
    return NurseData(
      id: json['id'],
      nurseId: json['nurse_id'],
      licenseNumber: json['license_number'],
      licenseExpiryDate: json['license_expiry_date'],
      yearsOfExperience: json['years_of_experience'],
      specialization: json['specialization'],
      bio: json['bio'],
      hourlyRate: json['hourly_rate'],
      availability: (json['availability'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e))
          .toList() ??
          [],
      adharcard: json['adharcard'],
      pancard: json['pancard'],
      nursingLicense: json['nursing_license'],
      certificate: (json['certificate'] is String &&
          json['certificate'].toString().startsWith('['))
          ? List<String>.from(jsonDecode(json['certificate']))
          : [],
      isVerified: json['is_verified'],
      remark: json['remark'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nurse_id': nurseId,
      'license_number': licenseNumber,
      'license_expiry_date': licenseExpiryDate,
      'years_of_experience': yearsOfExperience,
      'specialization': specialization,
      'bio': bio,
      'hourly_rate': hourlyRate,
      'availability': availability,
      'adharcard': adharcard,
      'pancard': pancard,
      'nursing_license': nursingLicense,
      'certificate': certificate,
      'is_verified': isVerified,
      'remark': remark,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
