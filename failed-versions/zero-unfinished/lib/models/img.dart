import 'dart:convert';

class Img {
  final String url;
  Img({
    this.url,
  });

  Img copyWith({
    String url,
  }) {
    return Img(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory Img.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Img(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Img.fromJson(String source) => Img.fromMap(json.decode(source));

  @override
  String toString() => 'Img(url: $url)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Img && o.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
