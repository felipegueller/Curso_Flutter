main() {
  int resultado = somar(32, 43);

  print("O valor da soma é: $resultado");
  print('O dobro do resultado é ${resultado * 2}');

  resultado *= 2;
  print("O valor do dobro da soma é: $resultado");
}

int somar(int a, int b) {
  return a + b;
}
