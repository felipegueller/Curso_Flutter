main(List<String> args) {
  var notas = [6.7, 3.4, 8.9, 7.4, 9.3, 2.5, 7.9];

  // essas funções podem ser utilizadas em várias listas diferentes, ou seja,
  // permite o reuso de código com a combinação do Where
  bool Function(double) notasBoasFn = (double nota) => nota >= 7;
  var notasMuitoBoasFn = (double nota) => nota >= 8.8;

  // se o elemento dor verdadeiro, notas boas recebe o valor
  var notasBoas = notas.where(notasBoasFn);
  var notasMuitoBoas = notas.where(notasMuitoBoasFn);

  print(notas);
  print(notasBoas);
  print(notasMuitoBoas);
}
