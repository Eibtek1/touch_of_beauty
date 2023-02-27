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
  bool? isAvailable;
  int? employeesNumber;
  double? numberOfStar;
  bool? isFavourite;
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
        this.isAvailable,
        this.employeesNumber,
        this.numberOfStar,
        this.isFavourite,
        this.serviceProvider,
        this.mainSection});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
        id : json['id'],
        title : json['title'],
        forCenter : json['forCenter'],
        description : json['description'],
        imgUrl : json['imgUrl'],
        isFeatured : json['isFeatured'],
        priceUnit : json['priceUnit'],
        price : json['price'],
        discount : json['discount'],
        finalPrice : json['finalPrice'],
        inCenter : json['inCenter'],
        inHome : json['inHome'],
        isAvailable : json['isAvailable'],
    employeesNumber : json['employeesNumber'],
    numberOfStar : json['numberOfStar'],
    isFavourite : json['isFavourite'],
    serviceProvider : json['serviceProvider'] != null
    ? ServiceProvider.fromJson(json['serviceProvider'])
        : null,
    mainSection : json['mainSection'] != null
    ? MainSection.fromJson(json['mainSection'])
        : null,
    );
  }

}

class ServiceProvider {
  String? id;
  String? fullName;
  String? userImgUrl;

  ServiceProvider({this.id, this.fullName, this.userImgUrl});

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
        id : json['id'],
        fullName : json['fullName'],
        userImgUrl : json['userImgUrl'],
    );
  }

}

class MainSection {
  int? id;
  String? title;
  String? imgUrl;

  MainSection({this.id, this.title, this.imgUrl});

  factory MainSection.fromJson(Map<String, dynamic> json) {
    return MainSection(
        id : json['id'],
        title : json['title'],
        imgUrl : json['imgUrl'],
    );
  }

}
