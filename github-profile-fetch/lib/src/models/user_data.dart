import 'dart:convert';

class UserData {
  final String username;
  final String photoUrl;
  final String bio;
  final String githubUrl;

  UserData({
    this.username,
    this.photoUrl,
    this.bio,
    this.githubUrl,
  });

  UserData copyWith({
    String username,
    String photoUrl,
    String bio,
    String githubUrl,
  }) {
    return UserData(
      username: username ?? this.username,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      githubUrl: githubUrl ?? this.githubUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'photoUrl': photoUrl,
      'bio': bio,
      'githubUrl': githubUrl,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserData(
      username: map['username'],
      photoUrl: map['photoUrl'],
      bio: map['bio'],
      githubUrl: map['githubUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(username: $username, photoUrl: $photoUrl, bio: $bio, githubUrl: $githubUrl)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserData &&
        o.username == username &&
        o.photoUrl == photoUrl &&
        o.bio == bio &&
        o.githubUrl == githubUrl;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        photoUrl.hashCode ^
        bio.hashCode ^
        githubUrl.hashCode;
  }
}
