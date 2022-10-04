class Regex {
  static RegExp email = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
  static RegExp digits = RegExp(r'[0-9]');
  static RegExp characters = RegExp(r'^[a-z A-Z 0-1]');
  static RegExp password =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
}
