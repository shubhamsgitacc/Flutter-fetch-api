class Empmodels {
  late int id;
  late String name, email, username;

  Empmodels(
      {this.id = 0, this.name = 'me', this.email = 'me', this.username = 'me'});

  factory Empmodels.fromjson(Map<String, dynamic> json) {
    return Empmodels(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username']);
  }
}
