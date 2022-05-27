class UserGit {
  String? usuario;
  String? name;
  String? descricao;
  String? imageUrl;

  UserGit({this.descricao, this.imageUrl, this.name, this.usuario});

  factory UserGit.fromJson(Map<String, dynamic> json) {
    return UserGit(
      usuario: json['login'] ?? "?",
      name: json['name'] ?? "?",
      descricao: json['bio'] ?? "?",
      imageUrl: json['avatar_url'] ??
          "https://cdn-icons.flaticon.com/png/512/4192/premium/4192747.png?token=exp=1653671541~hmac=0eb6023baf8b05328a5c310625400a80",
    );
  }
}
