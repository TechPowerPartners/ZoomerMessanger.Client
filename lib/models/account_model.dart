class AccountModel {
  String? username;
  String? password;
  String? phoneNumber;
  String? fullname;
  String? image;
  

  AccountModel(
      {this.username,
      this.password,
      this.phoneNumber,
      this.fullname,
      this.image,});

  AccountModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    fullname = json['fullname'];
    image = json['image'];
    }
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['fullname'] = this.fullname;
    data['image'] = this.image;
    
    return data;
  }
}