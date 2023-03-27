import 'package:equatable/equatable.dart';

class MainResponse extends Equatable{
  final dynamic errorCode;
  final dynamic errorMessage;
  final dynamic data;

  const MainResponse({
    this.data,
    this.errorCode,
    this.errorMessage,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    return MainResponse(
        errorCode: json['errorCode'],
        errorMessage: json['errorMessage'],
        data: json['data']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
   errorCode,
   errorMessage,
   data,
  ];
}
