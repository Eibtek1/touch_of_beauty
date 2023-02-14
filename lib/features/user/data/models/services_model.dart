class ServicesModel {
  int? id;
  String? title;
  bool? forCenter;
  String? description;
  String? imgUrl;
  bool? isFeatured;
  int? priceUnit;
  double? price;
  double? discount;
  double? finalPrice;
  bool? inCenter;
  bool? inHome;
  int? employeesNumber;
  bool? isAvailable;
  ServiceProvider? serviceProvider;
  MainSection? mainSection;

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
        this.employeesNumber,
        this.isAvailable,
        this.serviceProvider,
        this.mainSection});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    forCenter = json['forCenter'];
    description = json['description'];
    imgUrl = json['imgUrl'];
    isFeatured = json['isFeatured'];
    priceUnit = json['priceUnit'];
    price = json['price'];
    discount = json['discount'];
    finalPrice = json['finalPrice'];
    inCenter = json['inCenter'];
    inHome = json['inHome'];
    employeesNumber = json['employeesNumber'];
    isAvailable = json['isAvailable'];
    serviceProvider = json['serviceProvider'] != null
        ? ServiceProvider.fromJson(json['serviceProvider'])
        : null;
    mainSection = json['mainSection'] != null
        ? MainSection.fromJson(json['mainSection'])
        : null;
  }

}

class ServiceProvider {
  String? id;
  String? fullName;
  String? userImgUrl;

  ServiceProvider({this.id, this.fullName, this.userImgUrl});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userImgUrl = json['userImgUrl'];
  }

}

class MainSection {
  int? id;
  String? title;
  String? imgUrl;

  MainSection({this.id, this.title, this.imgUrl});

  MainSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['imgUrl'];
  }
}
