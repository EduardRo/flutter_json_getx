class RegisterRequestModel {
  String? email;
  String? password;

  RegisterRequestModel({this.email, this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}


 /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  } */

 /* factory RegisterRequestModel.fromJson(Map<String, dynamic> parsedJson) {
    return RegisterRequestModel(
      email: parsedJson['email'],
      password: parsedJson['password'],
    );
  } */