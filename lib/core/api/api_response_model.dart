class ResponseModel<T> {
  late bool? status;
  late String? message;
  late T data;

  ResponseModel({status, message, data}) {
    this.status = status ?? false;
    this.message = message ?? 'an error occurred please try again';
    this.data = data;
  }
}

class ErrorModel {
  bool? status;
  String? message;
  dynamic data;

  ErrorModel({
    this.status,
    this.message,
    this.data,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class ApiResponseModel {
  bool? status;
  String? message;
  dynamic data;

  ApiResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      ApiResponseModel(
        status: json["status"] ?? '',
        message: json["message"] ?? '',
        data: json["data"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
