import 'package:equatable/equatable.dart';

class ServicesModel extends Equatable {
  final int? id;
  final String? title;
  final bool? forCenter;
  final String? description;
  final String? imgUrl;
  final bool? isFeatured;
  final int? priceUnit;
  final double? price;
  final double? discount;
  final double? finalPrice;
  final bool? inCenter;
  final bool? inHome;
  final bool? isAvailable;
  final int? employeesNumber;
  final double? numberOfStar;
  final bool? isFavourite;
  final ServiceProvider? serviceProvider;
  final MainSection? mainSection;

  const ServicesModel(
      {this.id,
      this.title,
      this.forCenter,
      this.description,
      this.imgUrl,
      this.isFeatured,
      this.priceUnit,
      this.price,
      this.discount,
      this.finalPrice,
      this.inCenter,
      this.inHome,
      this.isAvailable,
      this.employeesNumber,
      this.numberOfStar,
      this.isFavourite,
      this.serviceProvider,
      this.mainSection});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      id: json['id'],
      title: json['title'],
      forCenter: json['forCenter'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      isFeatured: json['isFeatured'],
      priceUnit: json['priceUnit'],
      price: json['price'],
      discount: json['discount'],
      finalPrice: json['finalPrice'],
      inCenter: json['inCenter'],
      inHome: json['inHome'],
      isAvailable: json['isAvailable'],
      employeesNumber: json['employeesNumber'],
      numberOfStar: json['numberOfStar'],
      isFavourite: json['isFavourite'],
      serviceProvider: json['serviceProvider'] != null
          ? ServiceProvider.fromJson(json['serviceProvider'])
          : null,
      mainSection: json['mainSection'] != null
          ? MainSection.fromJson(json['mainSection'])
          : null,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        forCenter,
        description,
        imgUrl,
        isFeatured,
        priceUnit,
        price,
        discount,
        finalPrice,
        inCenter,
        inHome,
        isAvailable,
        employeesNumber,
        numberOfStar,
        isFavourite,
        serviceProvider,
        mainSection,
      ];
}

class ServiceProvider extends Equatable {
  final String? id;
  final String? fullName;
  final String? userImgUrl;
  final Addresses? addresses;
  final double? numberOfStar;

  const ServiceProvider(
      {this.id,
      this.fullName,
      this.userImgUrl,
      this.addresses,
      this.numberOfStar});

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['id'],
      fullName: json['fullName'],
      userImgUrl: json['userImgUrl'],
      addresses: json['addresses'] != null
          ? Addresses.fromJson(json['addresses'])
          : null,
      numberOfStar: json['numberOfStar'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        fullName,
        userImgUrl,
        addresses,
        numberOfStar,
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

class MainSection extends Equatable {
  final int? id;
  final String? title;
  final String? imgUrl;

  const MainSection({this.id, this.title, this.imgUrl});

  factory MainSection.fromJson(Map<String, dynamic> json) {
    return MainSection(
      id: json['id'],
      title: json['title'],
      imgUrl: json['imgUrl'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        imgUrl,
      ];
}

class ServicesDetailsModel extends Equatable {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final bool? forCenter;
  final String? description;
  final String? imgUrl;
  final bool? isFeatured;
  final int? priceUnit;
  final double? price;
  final double? discount;
  final double? finalPrice;
  final bool? inCenter;
  final bool? inHome;
  final bool? isAvailable;
  final int? employeesNumber;
  final double? numberOfStar;
  final bool? isFavourite;
  final ServiceProvider? serviceProvider;
  final MainSection? mainSection;
  final String? duration;
  const ServicesDetailsModel(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.forCenter,
      this.isAvailable,
      this.description,
        this.duration,
        this.imgUrl,
      this.isFeatured,
      this.priceUnit,
      this.price,
      this.discount,
      this.finalPrice,
      this.inCenter,
      this.inHome,
      this.employeesNumber,
      this.numberOfStar,
      this.isFavourite,
      this.serviceProvider,
      this.mainSection});

  factory ServicesDetailsModel.fromJson(Map<String, dynamic> json) {
    return ServicesDetailsModel(
      id: json['id'],
      titleAr: json['titleAr'],
      titleEn: json['titleEn'],
      forCenter: json['forCenter'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      isFeatured: json['isFeatured'],
      priceUnit: json['priceUnit'],
      price: json['price'],
      discount: json['discount'],
      finalPrice: json['finalPrice'],
      isAvailable: json['isAvailable'],
      inCenter: json['inCenter'],
      inHome: json['inHome'],
      employeesNumber: json['employeesNumber'],
      duration: json['duration'],
      numberOfStar: json['numberOfStar'],
      isFavourite: json['isFavourite'],
      serviceProvider: json['serviceProvider'] != null
          ? ServiceProvider.fromJson(json['serviceProvider'])
          : null,
      mainSection: json['mainSection'] != null
          ? MainSection.fromJson(json['mainSection'])
          : null,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    titleAr,
    titleEn,
    forCenter,
    description,
    imgUrl,
    isFeatured,
    priceUnit,
    price,
    discount,
    finalPrice,
    inCenter,
    inHome,
    isAvailable,
    employeesNumber,
    numberOfStar,
    isFavourite,
    serviceProvider,
    mainSection,
  ];
}
