class User {
  int id;
  String name, username, city, phone;
  User(this.id, this.name, this.username, this.city, this.phone);

  factory User.forTestDio(Map<String, dynamic> userObj) {
    return User(
      userObj['id'],
      userObj['name'],
      userObj['username'],
      userObj['address']['city'],
      userObj['phone'],
    );
  }
}
