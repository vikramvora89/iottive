class LoginModel {
  bool success;
  int userId;
  String firstName;
  String lastName;
  String primaryEmail;
  String profileImageURL;
  String authToken;
  String mobileNumber;
  int rewardPoint;
  String aliasId;
  String saferPayToken;
  String saferPayCardDetails;
  String birthDate;

  LoginModel(
      {this.success,
      this.userId,
      this.firstName,
      this.lastName,
      this.primaryEmail,
      this.profileImageURL,
      this.authToken,
      this.mobileNumber,
      this.rewardPoint,
      this.aliasId,
      this.saferPayToken,
      this.saferPayCardDetails,
      this.birthDate});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    primaryEmail = json['primaryEmail'];
    profileImageURL = json['profileImageURL'];
    authToken = json['authToken'];
    mobileNumber = json['mobileNumber'];
    rewardPoint = json['rewardPoint'];
    aliasId = json['aliasId'];
    saferPayToken = json['saferPayToken'];
    saferPayCardDetails = json['saferPayCardDetails'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['primaryEmail'] = this.primaryEmail;
    data['profileImageURL'] = this.profileImageURL;
    data['authToken'] = this.authToken;
    data['mobileNumber'] = this.mobileNumber;
    data['rewardPoint'] = this.rewardPoint;
    data['aliasId'] = this.aliasId;
    data['saferPayToken'] = this.saferPayToken;
    data['saferPayCardDetails'] = this.saferPayCardDetails;
    data['birthDate'] = this.birthDate;
    return data;
  }
}
