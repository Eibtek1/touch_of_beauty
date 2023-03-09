import 'package:equatable/equatable.dart';

class FavoriteServicesProviderModel extends Equatable {
  final int? id;
  final String? providerId;
  final String? title;
  final String? description;
  final String? userImgUrl;
  final bool? isFeatured;
  final String? email;
  final String? city;
  final int? userType;
  final List<Addresses>? addresses;

  const FavoriteServicesProviderModel(
      {this.id,
      this.providerId,
      this.title,
      this.description,
      this.userImgUrl,
      this.isFeatured,
      this.email,
      this.city,
      this.userType,
      this.addresses});

  factory FavoriteServicesProviderModel.fromJson(Map<String, dynamic> json) {
    List<Addresses>? addresses;
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    return FavoriteServicesProviderModel(
      id: json['id'],
      providerId: json['providerId'],
      title: json['title'],
      description: json['description'],
      userImgUrl: json['userImgUrl'],
      isFeatured: json['isFeatured'],
      email: json['email'],
      city: json['city'],
      userType: json['userType'],
      addresses: addresses,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
  id,
  providerId,
  title,
  description,
  userImgUrl,
  isFeatured,
  email,
  city,
  userType,
   addresses,
  ];
}

class Addresses extends Equatable {
  final String? addressDetails;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? flatNumber;
  final String? city;

  const Addresses(
      {this.addressDetails,
      this.region,
      this.street,
      this.buildingNumber,
      this.flatNumber,
      this.city});

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
      addressDetails: json['addressDetails'],
      region: json['region'],
      street: json['street'],
      buildingNumber: json['buildingNumber'],
      flatNumber: json['flatNumber'],
      city: json['city'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        addressDetails,
        region,
        street,
        buildingNumber,
        flatNumber,
        city,
      ];
}
