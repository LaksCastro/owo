import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:zero/models/category.dart' as Models show Category;

class UserPreferences {
  final propTypesShowed = false;
  final introShowed = false;
  List<Models.Category> blockedCategories;

  UserPreferences({
    this.blockedCategories,
  });

  UserPreferences copyWith({
    List<Models.Category> blockedCategories,
  }) {
    return UserPreferences(
      blockedCategories: blockedCategories ?? this.blockedCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'blockedCategories': blockedCategories?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserPreferences(
      blockedCategories: List<Models.Category>.from(
          map['blockedCategories']?.map((x) => Models.Category.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPreferences.fromJson(String source) =>
      UserPreferences.fromMap(json.decode(source));

  @override
  String toString() => 'UserPreferences(blockedCategories: $blockedCategories)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserPreferences &&
        listEquals(o.blockedCategories, blockedCategories);
  }

  @override
  int get hashCode => blockedCategories.hashCode;
}
