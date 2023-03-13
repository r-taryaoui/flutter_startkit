class ApiResponse {
  bool isSuccessful = false;
  Map<String, dynamic>? body;
  List<dynamic>? bodyList;
  ApiResponseError? error;

  ApiResponse({
    this.isSuccessful = false,
    this.body,
    this.error,
  });

  ApiResponse.fromJson(Map<String, dynamic> response) {
    if (response.containsKey("successful")) {
      try {
        isSuccessful = response['successful'] as bool;
      } catch (e) {
        isSuccessful = false;
      }
    }
    if (response.containsKey("response")) {
      if (response['response'] is List<dynamic>) {
        bodyList = response['response'];
      } else {
        body = response['response'];
      }
    }
    if (response.containsKey("error") && response['error'] != null) {
      error = ApiResponseError.fromJson(response['error']);
    }
  }

  static ApiResponse responseFromJson(dynamic response) {
    Map<String, dynamic> json = Map<String, dynamic>.from(response);
    return ApiResponse.fromJson(json);
  }

  ApiResponse.fromError(String code, String title, String message) {
    isSuccessful = false;
    error = ApiResponseError(code: code, title: title, message: message);
  }

  ApiResponse.fromException(Object e) {
    ApiResponse.fromError("Exception", "Attention", e.toString());
  }
}

class ApiResponseError {
  String code = "Erreur";
  String title = "Attention !";
  String message = "Attention, quelque chose s'est mal passé";

  ApiResponseError({
    this.code = "Erreur",
    this.title = "Attention !",
    this.message = "Attention, quelque chose s'est mal passé",
  });

  ApiResponseError.fromJson(Map<String, dynamic> response) {
    if (response.containsKey("code")) {
      code = response['code'].toString();
    }
    if (response.containsKey("title")) {
      title = response['title'].toString();
    }
    if (response.containsKey("message")) {
      message = response['message'].toString();
    }
  }
}
