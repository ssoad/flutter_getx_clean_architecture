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
