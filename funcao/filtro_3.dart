// Função do tipo filtro de valores double
// toda a lógica ficou aqui dentro
List filtrarV1<double>(List<double> lista, bool Function(double) fn) {
  List<double> listaFiltrada = [];

  for (double elemento in lista) {
    /* Se o elemento retornado pela função fn for true, faça */
    if (fn(elemento)) {
      // adiciona o elemento na lista filtrada
      listaFiltrada.add(elemento);
    }
  }

  return listaFiltrada;
}

/*
  - A função Recebe uma lista e retorna uma lista
  - Recebe também como parâmetro uma função de qualquer tipo com o valor em bool
 */
List filtrarV2<E>(List<E> lista, bool Function(E) fn) {
  List<E> listaFiltrada = [];

  for (E elemento in lista) {
    if (fn(elemento)) {
      listaFiltrada.add(elemento);
    }
  }

  // Está lógica noã funciona
  // listaFiltrada = lista.where(fn);

  return listaFiltrada;
}

main(List<String> args) {
  var notas = [6.7, 3.4, 8.9, 7.4, 9.3, 2.5, 7.9];

  var boasNotasFn = (double nota) => nota >= 7.5;

  var somenteNotasBoas = filtrarV1(notas, boasNotasFn);
  print(somenteNotasBoas);

  var nomes = ["Felipe", "Ana", "Gui", "Robson", "Geninpapo", "Leléto"];
  var nomesGrandesFn = (String nome) => nome.length >= 4;
  print(filtrarV2(nomes, nomesGrandesFn));

  var inteiros = [1, 5, 23, 65, 43, 76, 89, 120, 234, 643, 455];
  var inteirosIntervalo = (int inteiro) => inteiro <= 100 && inteiro >= 0;
  print(filtrarV2(inteiros, inteirosIntervalo));
}
