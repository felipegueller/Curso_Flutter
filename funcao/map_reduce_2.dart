main(List<String> args) {
  var notas = [7.3, 6.8, 5.2, 4.3, 8.8, 7.9, 1.7, 10.0];
  /*Função reduce transforma um elemento em qualquer outra coisa */
  var total = notas.reduce(somar);
  print(total.round());

  var nomes = [
    "Felipe",
    "Tenébrio",
    "Vargas",
    "Leléto",
    "Fred",
    "Deive",
    "Lebron"
  ];
  print(nomes.reduce(juntar));

  var valores = [21.32, 32.32, 54.76, 42.65, 75.65];
  var resultado = valores.reduce((a, e) => a + e);
  print(resultado.round());
}

double somar(double acumulador, double elemento) {
  print("$acumulador $elemento");
  return acumulador + elemento;
}

String juntar(String acumulador, String elemento) {
  print("$acumulador => $elemento");
  return "$acumulador, $elemento";
}

// String Function(String, String) juntar = (acumulador, elemento) => acumulador + elemento;
