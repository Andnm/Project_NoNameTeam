class ApiResponse {
  ApiResponse({this.description, this.data, this.title, this.message});

  String? description;
  String? message;
  dynamic data;
  String? title;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
      description: json["description"],
      title: json.containsKey("title") ? json["title"] : "",
      message: json.containsKey("message") ? json["message"] : "",
      data: json["data"]);

  Map<String, dynamic> toJson() => {"description": description, "title": title, "message": message, "data": data};
}
