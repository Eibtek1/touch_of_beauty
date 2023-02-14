class GetServicesProviderModel {
  int? currentPage;
  int? totalItems;
  int? totalPages;
  List<ServicesProviderModel>? items;

  GetServicesProviderModel(
      {this.currentPage, this.totalItems, this.totalPages, this.items});

  GetServicesProviderModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <ServicesProviderModel>[];
      json['items'].forEach((v) {
        items!.add(ServicesProviderModel.fromJson(v));
      });
    }
  }

}

class ServicesProviderModel {
  String? id;
  String? title;
  String? description;
  String? userImgUrl;
  bool? isFeatured;
  String? email;
  String? city;
  int? userType;
  List<Addresses>? addresses;

  ServicesProviderModel(
      {this.id,
        this.title,
        this.description,
        this.userImgUrl,
        this.isFeatured,
        this.email,
        this.city,
        this.userType,
        this.addresses});

  ServicesProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userImgUrl = json['userImgUrl'];
    isFeatured = json['isFeatured'];
    email = json['email'];
    city = json['city'];
    userType = json['userType'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }

}

class Addresses {
  String? addressDetails;
  String? region;
  String? street;
  String? buildingNumber;
  String? flatNumber;
  String? city;

  Addresses(
      {this.addressDetails,
        this.region,
        this.street,
        this.buildingNumber,
        this.flatNumber,
        this.city});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressDetails = json['addressDetails'];
    region = json['region'];
    street = json['street'];
    buildingNumber = json['buildingNumber'];
    flatNumber = json['flatNumber'];
    city = json['city'];
  }

}
