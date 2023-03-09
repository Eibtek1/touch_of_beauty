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
  String? providerId;
  String? title;
  String? description;
  String? userImgUrl;
  bool? isFeatured;
  String? email;
  String? city;
  int? userType;
  List<Prizes>? prizes;
  List<WorkDays>? workDays;
  List<MainSection>? mainSection;
  List<Addresses>? addresses;
  List<PicturesLibrary>? picturesLibrary;
  int? servicesCount;
  bool? isFavourite;
  double? numberOfStar;

  ServicesProviderModel(
      {this.id,
        this.providerId,
        this.title,
        this.description,
        this.userImgUrl,
        this.isFeatured,
        this.email,
        this.city,
        this.userType,
        this.prizes,
        this.workDays,
        this.mainSection,
        this.addresses,
        this.picturesLibrary,
        this.servicesCount,
        this.isFavourite,
        this.numberOfStar,
      });

  ServicesProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['providerId'];
    title = json['title'];
    description = json['description'];
    userImgUrl = json['userImgUrl'];
    isFeatured = json['isFeatured'];
    email = json['email'];
    city = json['city'];
    userType = json['userType'];
    if (json['prizes'] != null) {
      prizes = <Prizes>[];
      json['prizes'].forEach((v) {
        prizes!.add(Prizes.fromJson(v));
      });
    }
    if (json['workDays'] != null) {
      workDays = <WorkDays>[];
      json['workDays'].forEach((v) {
        workDays!.add(WorkDays.fromJson(v));
      });
    }
    if (json['mainSection'] != null) {
      mainSection = <MainSection>[];
      json['mainSection'].forEach((v) {
        mainSection!.add(MainSection.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    if (json['picturesLibrary'] != null) {
      picturesLibrary = <PicturesLibrary>[];
      json['picturesLibrary'].forEach((v) {
        picturesLibrary!.add(PicturesLibrary.fromJson(v));
      });
    }
    servicesCount = json['servicesCount'];
    isFavourite = json['isFavourite'];
    numberOfStar = json['numberOfStar'];
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

class Prizes {
  int? id;
  String? title;
  String? description;

  Prizes({this.id, this.title, this.description});

  Prizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class WorkDays {
  int? id;
  int? day;
  String? from;
  String? to;
  String? moreData;

  WorkDays({this.id, this.day, this.from, this.to, this.moreData});

  WorkDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    moreData = json['moreData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['from'] = from;
    data['to'] = to;
    data['moreData'] = moreData;
    return data;
  }
}

class MainSection {
  int? mainSectionId;
  String? titele;
  String? imgUrl;

  MainSection({this.mainSectionId, this.titele, this.imgUrl});

  MainSection.fromJson(Map<String, dynamic> json) {
    mainSectionId = json['mainSectionId'];
    titele = json['titele'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mainSectionId'] = mainSectionId;
    data['titele'] = titele;
    data['imgUrl'] = imgUrl;
    return data;
  }
}

class PicturesLibrary {
  String? imgUrl;

  PicturesLibrary({this.imgUrl});

  PicturesLibrary.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    return data;
  }
}
