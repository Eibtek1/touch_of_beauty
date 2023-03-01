import 'package:equatable/equatable.dart';

class PicturesModel extends Equatable{
  final int? id;
  final String? imgUrl;
  final String? createdAt;

  const PicturesModel({this.id, this.imgUrl, this.createdAt});

  factory PicturesModel.fromJson(Map<String, dynamic> json) {
    return PicturesModel(
        id : json['id'],
        imgUrl : json['imgUrl'],
        createdAt : json['createdAt'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    imgUrl,
    createdAt,
  ];

}