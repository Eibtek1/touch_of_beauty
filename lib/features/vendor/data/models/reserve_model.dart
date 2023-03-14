import 'package:equatable/equatable.dart';

class ReserveModel extends Equatable {
  final int? id;
  final String? createdOn;
  final AddressData? addressData;
  final double? total;
  final int? orderStatus;
  final Service? service;
  final User? user;

  const ReserveModel(
      {this.id,
      this.createdOn,
      this.user,
      this.addressData,
      this.total,
      this.orderStatus,
      this.service});

  factory ReserveModel.fromJson(Map<String, dynamic> json) {
    return ReserveModel(
      id: json['id'],
      createdOn: json['createdOn'],
      addressData: json['addressData'] != null
          ? AddressData.fromJson(json['addressData'])
          : null,
      total: json['total'],
      orderStatus: json['orderStatus'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      service:
          json['service'] != null ? Service.fromJson(json['service']) : null,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        createdOn,
        addressData,
        total,
        orderStatus,
        service,
      ];
}

class AddressData extends Equatable {
  final String? name;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? flatNumber;
  final String? addressDetails;

  const AddressData(
      {this.name,
      this.region,
      this.street,
      this.buildingNumber,
      this.flatNumber,
      this.addressDetails});

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      name: json['name'],
      region: json['region'],
      street: json['street'],
      buildingNumber: json['buildingNumber'],
      flatNumber: json['flatNumber'],
      addressDetails: json['addressDetails'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        region,
        street,
        buildingNumber,
        flatNumber,
        addressDetails,
      ];
}

class Service extends Equatable {
  final int? id;
  final String? title;
  final String? imgUrl;
  final bool? isAvailable;
  final double? finalPrice;

  const Service(
      {this.id, this.title, this.imgUrl, this.isAvailable, this.finalPrice});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      imgUrl: json['imgUrl'],
      id: json['id'],
      title: json['title'],
      isAvailable: json['isAvailable'],
      finalPrice: json['finalPrice'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        isAvailable,
        finalPrice,
        imgUrl,
      ];
}

class User extends Equatable {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;

  const User({this.id, this.fullName, this.phoneNumber, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        fullName,
        phoneNumber,
        email,
      ];
}
