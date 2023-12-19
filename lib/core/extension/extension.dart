import 'dart:ui';

extension StringExtension on String {
  String? toCapitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension ColorExtension on Color {
  String toHex() => '#${value.toRadixString(16).substring(2, 8)}';
  Color fromHex(String hex) =>
      Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

Color? parseColorFromHex(String? hexColor) {
  return hexColor != null
      ? Color(int.parse(hexColor.replaceFirst('#', '0xFF')))
      : null;
}


enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}
