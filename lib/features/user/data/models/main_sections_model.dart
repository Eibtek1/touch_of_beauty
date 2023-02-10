class MainSectionsModel {
  int? id;
  String? title;
  String? description;
  bool? isFeatured;
  String? imgUrl;
  int? rank;

  MainSectionsModel(
      {this.id,
        this.title,
        this.description,
        this.isFeatured,
        this.imgUrl,
        this.rank});

  MainSectionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isFeatured = json['isFeatured'];
    imgUrl = json['imgUrl'];
    rank = json['rank'];
  }

}
