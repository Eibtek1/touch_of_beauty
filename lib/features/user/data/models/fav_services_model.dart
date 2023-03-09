import 'package:equatable/equatable.dart';

class FavoriteServicesModel extends Equatable {
  final int? id;
  final int? serviceId;
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
  final ServiceProvider? serviceProvider;
  final MainSection? mainSection;

  const FavoriteServicesModel(
      {this.id,
      this.serviceId,
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
      this.serviceProvider,
      this.mainSection});

  factory FavoriteServicesModel.fromJson(Map<String, dynamic> json) {
    MainSection? mainSection = MainSection.fromJson(json['mainSection']);
    ServiceProvider? serviceProvider = ServiceProvider.fromJson(json['serviceProvider']);
    return FavoriteServicesModel(
      id: json['id'],
      serviceId: json['serviceId'],
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
      serviceProvider: ServiceProvider.fromJson(json['serviceProvider']),
      mainSection: MainSection.fromJson(json['mainSection']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        serviceId,
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
        serviceProvider,
        mainSection,
      ];
}

class ServiceProvider extends Equatable{
  final String? id;
  final String? fullName;
  final String? userImgUrl;

  const ServiceProvider({this.id, this.fullName, this.userImgUrl});

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
        id : json['id'],
        fullName : json['fullName'],
        userImgUrl : json['userImgUrl'],
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [
   id,
   fullName,
   userImgUrl,
  ];
}

class MainSection extends Equatable{
  final int? id;
  final String? title;
  final String? imgUrl;

  const MainSection({this.id, this.title, this.imgUrl});

 factory MainSection.fromJson(Map<String, dynamic> json) {
    return MainSection(
        id : json['id'],
        title : json['title'],
        imgUrl : json['imgUrl'],
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
