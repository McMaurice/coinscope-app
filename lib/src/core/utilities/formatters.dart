import 'package:intl/intl.dart';

class AppFormatter {
  // Capitalizes the first letter and makes the rest lowercase
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  // Removes the last character from a string
  static String removeLastCharacter(String text) {
    if (text.isEmpty) return text;
    return text.substring(0, text.length - 1);
  }

  //---FORMATS THE AMOUNT TO CURRENCY VALUES---
  static String currency(num amount) {
    final doubleAmount = amount.toDouble();
    final rounded = (doubleAmount * 100).ceilToDouble() / 100;
    final formatter = NumberFormat('#,##0.00', 'en_US'); // always 2 decimals
    return formatter.format(rounded);
  }

  static String formatCompactNumber(num number) {
    if (number >= 1e12) {
      return "${(number / 1e12).toStringAsFixed(2)}T";
    } else if (number >= 1e9) {
      return "${(number / 1e9).toStringAsFixed(2)}B";
    } else if (number >= 1e6) {
      return "${(number / 1e6).toStringAsFixed(2)}M";
    } else if (number >= 1e3) {
      return "${(number / 1e3).toStringAsFixed(2)}K";
    } else {
      return number.toStringAsFixed(2);
    }
  }
}
