class AddressModel {
  int? id;
  int? cityId;
  String? cityName;
  String? region;
  String? street;
  String? buildingNumber;
  String? flatNumber;
  String? addressDetails;
  int? currentIdx;
  AddressModel(
      {this.id,
        this.cityId,
        this.cityName,
        this.region,
        this.street,
        this.buildingNumber,
        this.flatNumber,
        this.currentIdx,
        this.addressDetails});

  AddressModel.fromJson(Map<String, dynamic> json, int currentIndex) {
    id = json['id'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    region = json['region'];
    street = json['street'];
    buildingNumber = json['buildingNumber'];
    flatNumber = json['flatNumber'];
    addressDetails = json['addressDetails'];
    currentIdx = currentIndex;
  }

}