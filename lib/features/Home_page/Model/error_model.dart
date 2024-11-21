class ErrorModel {
  final String? status;
  final int? code;
  final String? error;
  final int? statusCode;

  ErrorModel({
    this.status,
    this.code,
    this.error,
    this.statusCode,
  });

  ErrorModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        code = json['code'] as int?,
        statusCode = json['status_code'] as int?,
        error = json['error'] as String?;

  Map<String, dynamic> toJson() => {'status': status, 'code': code, 'error': error};
}
