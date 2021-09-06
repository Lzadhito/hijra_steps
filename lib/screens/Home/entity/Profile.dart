class Profile {
  final String name;
  final String avatarURL;

  Profile({
    required this.name,
    required this.avatarURL,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      avatarURL: json['avatar_url'],
    );
  }
}
