class User{
  int id;
  String avatar;
  String firstName;
  String lastName;
  String email;


  User(this.id, this.avatar, this.firstName, this.lastName, this.email);


  User.fromJson(Map<String, dynamic> json){
    id= json['id'];
    avatar =json['avatar'];
    firstName=json["first_name"];
    lastName=json["last_name"];
    email=json["email"];

  }
}
