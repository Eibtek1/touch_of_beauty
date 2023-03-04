class ServicesModel {
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

  ServicesModel(
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
}

class ServiceProvider {
  final String? id;
  final String? fullName;
  final String? userImgUrl;
  final Addresses? addresses;
  final double? numberOfStar;

  ServiceProvider(
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
}

class Addresses {
  final String? addressDetails;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? flatNumber;
  final String? city;

  Addresses(
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
}

class MainSection {
  final int? id;
  final String? title;
  final String? imgUrl;

  MainSection({this.id, this.title, this.imgUrl});

  factory MainSection.fromJson(Map<String, dynamic> json) {
    return MainSection(
      id: json['id'],
      title: json['title'],
      imgUrl: json['imgUrl'],
    );
  }
}
