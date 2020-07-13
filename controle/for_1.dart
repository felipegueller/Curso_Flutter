main() {
  for (int i = 100; i >= 0; i -= 4) {
    print("i = $i");
  }
  print("");

  int b = 0;
  for (; b < 10;) {
    print("b = $b");
    b++;
  }
  print("");

  // Arra
  var notas = [8.9, 7.6, 3.5, 4.7, 8.6, 4.6];
  for (int i = 0; i < notas.length; i++) {
    print("${i + 1}° nota: ${notas[i]}");
  }

  print("Fim!");
}
