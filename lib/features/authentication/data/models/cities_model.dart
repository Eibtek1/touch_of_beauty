class CitiesModel {
  int? id;
  String? name;
  String? countryName;

  CitiesModel({this.id, this.name, this.countryName});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryName = json['countryName'];
  }

}