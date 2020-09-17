// retorna uma função com o valor inteiro
int Function(int) somaParcial(int a) {
  int c = 0; // variáveis dentro da função também poderam participar da soma

  return (int b) => a + b + c;
}

main() {
  print(
      somaParcial(2)(10)); // 2 é o parâmetro a e o 10 representa o parâmetro b

  // salva o valor da soma com o primeiro parâmetro 10, poupando memória para cálculos com o mesmo parâmtro
  var somaCom10 = somaParcial(10);

  // faz o resto com cálculo passando o segundo parâmetro(int b),
  print(somaCom10(3));
  print(somaCom10(7));
  print(somaCom10(19));

  var somaCom8 = somaParcial(8);

  print(somaCom8(5));
}
