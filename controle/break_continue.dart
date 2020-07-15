main(List<String> args) {
  int aux;

  for (int i = 0; i < 10; i++) {
    if (i == 6) {
      aux = i;
      break;
    }
  }
  print("Valor de i = ${aux} \n");

  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      continue; // quebra essa repetição
    }
    print("valor de i = ${i}");
  }
}
