// for in, muito semelhante ao foreach
main(List<String> args) {
  var notas = [8.9, 7.6, 3.5, 4.7, 8.6, 4.6];

  for (var nota in notas) {
    print("O valor da nota é $nota;");
  }

  var coordenadas = [
    [1, 3],
    [9, 1],
    [4, 6],
    [13, 0]
  ];

  for (var coordenada in coordenadas) {
    for (var ponto in coordenada) {
      print("O valor do ponto é $ponto;");
    }
  }
}
