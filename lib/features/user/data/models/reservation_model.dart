import 'package:equatable/equatable.dart';

class ReservationModel extends Equatable {
  final int? id;
  final String? createdOn;
  final AddressData? addressData;
  final String? addressDetails;
  final double? total;
  final int? orderStatus;
  final Service? service;
  final Provider? provider;

  const ReservationModel(
      {this.id,
      this.createdOn,
      this.addressData,
      this.addressDetails,
      this.total,
      this.orderStatus,
      this.service,
      this.provider});

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      createdOn: json['createdOn'],
      addressData: AddressData.fromJson(json['addressData']),
      addressDetails: json['addressDetails'],
      total: json['total'],
      orderStatus: json['orderStatus'],
      service: Service.fromJson(json['service']),
      provider: Provider.fromJson(json['provider']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdOn,
        addressData,
        addressDetails,
        total,
        orderStatus,
        service,
        provider,
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
  final bool? isAvailable;
  final double? finalPrice;

  const Service({this.id, this.title, this.isAvailable, this.finalPrice});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      isAvailable: json['isAvailable'],
      finalPrice: json['finalPrice'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        isAvailable,
        finalPrice,
      ];
}

class Provider extends Equatable {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;

  const Provider({this.id, this.fullName, this.phoneNumber, this.email});

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        phoneNumber,
        email,
      ];
}
