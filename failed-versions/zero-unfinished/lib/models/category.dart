import 'dart:convert';

class Category {
  final String id;
  final String label;

  Category({
    this.id,
    this.label,
  });

  Category copyWith({
    String id,
    String label,
  }) {
    return Category(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id'],
      label: map['label'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, label: $label)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Category && o.id == id && o.label == label;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode;
}
