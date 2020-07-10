main(List<String> args) {
  double nota = 6.99.roundToDouble();
  print(nota);

  print("Texto".toUpperCase());

  String s1 = "Felipe Gueller";
  String s2 = s1.substring(0, 9);
  String s3 = s2.toUpperCase();
  String s4 = s3.padRight(15, "!"); // completa os caracteres restantes com !

  var s5 = "Felipe Gueller"
  .substring(0, 8)
  .toUpperCase()
  .padRight(15, "!");

  print(s4);
  print(s5);
}