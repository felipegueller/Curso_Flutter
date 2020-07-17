main() {
  int resultado = somar(32, 43);

  print("O valor da soma é: $resultado");

  resultado *= 2;
  print("O valor do dobro da soma é: $resultado");
}

int somar(int a, int b) {
  return a + b;
}
