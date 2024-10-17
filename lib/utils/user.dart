class Users {
  String? uid;
  String? fullname;
  String? username;
  String? email;
  String? password;
  String? confirmpassword;

  Users(
      {this.uid,
      this.fullname,
      this.username,
      this.email,
      this.password,
      this.confirmpassword});

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'username': username,
      'email': email,
      'password': password,
      'confirmpassword': confirmpassword,
    };
  }
}
