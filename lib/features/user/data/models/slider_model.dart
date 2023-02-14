class SliderModel {
  int? id;
  String? name;
  String? description;
  String? imgUrl;

  SliderModel({this.id, this.name, this.description, this.imgUrl});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['imgUrl'];
  }

}
