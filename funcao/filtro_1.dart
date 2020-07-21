main(List<String> args) {
  var notas = [6.7, 3.4, 8.9, 7.4, 9.3, 2.5, 7.9];
  /* Filtro para a nova lista receber apenas as notas maiores que 7(nota >= 7.0) */

  var notasBoas = [];

  for (double nota in notas) {
    if (nota >= 7.0) {
      notasBoas.add(nota);
    }
  }
  print(notasBoas);
  
  var notasMuitoBoas = [];

  for (double nota in notas) {
    if (nota >= 8.8) {
      notasMuitoBoas.add(nota);
    }
  }
  print(notasMuitoBoas);

  
}
