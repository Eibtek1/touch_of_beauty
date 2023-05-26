class AvailableDateModel {
  int?id;
  String? toHour;
  String? fromHour;
  String? moreData;


  AvailableDateModel({

    this.fromHour,
    this.id,
    this.toHour,
    this.moreData,
  });

  AvailableDateModel.fromJson(Map<String, dynamic> json) {
    fromHour = json['from'];
    toHour = json['to'];
    moreData = json['moreData'];
    id = json['id'];
  }
}