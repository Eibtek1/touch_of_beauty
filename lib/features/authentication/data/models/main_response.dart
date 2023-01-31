class MainResponse {
  dynamic errorCode;
  dynamic errorMessage;
  dynamic data;

  MainResponse({
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
}
