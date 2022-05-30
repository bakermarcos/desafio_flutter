class UserStarWars {
  int? id;
  String? name;
  String? altura;
  String? massa;
  String? nascimento;
  UserStarWars({this.name, this.nascimento, this.altura, this.massa});

  factory UserStarWars.fromJson(Map<String, dynamic> json) {
    return UserStarWars(
      altura: json['height'] ?? "?",
      name: json['name'] ?? "?",
      nascimento: json['birth_year'] ?? "?",
      massa: json['mass'] ?? "?",
    );
  }
}
