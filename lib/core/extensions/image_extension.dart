extension ImageExtension on String {
  static String base = "lib/core/assets/";

  String get icon => "${base}icons/$this";
  String get image => "${base}images/$this";

  String get toPng => "$this.png";
}
