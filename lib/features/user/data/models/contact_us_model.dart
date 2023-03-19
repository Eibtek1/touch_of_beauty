import 'package:equatable/equatable.dart';

class ContactUsModel extends Equatable {
  final int? id;
  final String? whatsAppNumber;
  final String? phoneNumber;
  final String? email;
  final String? link;
  final String? faceBookLink;
  final String? termsAndConditions;

  const ContactUsModel(
      {this.id,
      this.whatsAppNumber,
      this.phoneNumber,
      this.email,
      this.link,
      this.faceBookLink,
      this.termsAndConditions});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      id: json['id'],
      whatsAppNumber: json['whatsAppNumber'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      link: json['link'],
      faceBookLink: json['faceBookLink'],
      termsAndConditions: json['termsAndConditions'],
    );
  }

  @override
  List<Object?> get props => [
   id,
   whatsAppNumber,
   phoneNumber,
   email,
   link,
   faceBookLink,
   termsAndConditions,

  ];
}
