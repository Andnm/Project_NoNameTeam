/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImZpcnN0TmFtZSI6IlRydW5nIiwibGFzdE5hbWUiOiJEdW9uZyIsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwicm9sZU5hbWUiOiJBZG1pbiIsInJvbGVfaWQiOiI2M2U0NzMwZjYyYmY5NmQ4ZGY0ODBmNTgiLCJpZCI6IjYzZTFkMDVlNjA3NjVjMmYyZGQ0ZTZhOSJ9LCJpYXQiOjE2NzkzNDQ2ODcsImV4cCI6MTY3OTQzMTA4N30.WwHgbLFAjldrSQnHVWUpWD8_CJsJgo6jNDHKQs6crDM"

class LoginResponse {
  LoginResponse({
    this.accessToken,
  });

  LoginResponse.fromJson(dynamic json) {
    accessToken = json['accessToken'];
  }
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    return map;
  }
}
