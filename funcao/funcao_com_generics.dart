Object segundoElementoV1(List lista) {
  return lista.length >= 2 ? lista[1] : null;
}

// tipo E genérico, ou seja, pode ser qualquer coisa
E segundoElementoV2<E>(List<E> lista) {
  // Função genérica
  return lista.length >= 2 ? lista[1] : null;
}

main(List<String> args) {
  var lista = [3, 6, 23, 5, 32, 7];

  print(segundoElementoV1(lista));

  int segundoElemento = segundoElementoV2<int>(lista);
  print("Segundo elemento V2: $segundoElemento");

  // não necessariamente precisa amarrar o tipo da função
  segundoElemento = segundoElementoV2(lista);
  print("Segundo elemento V2: $segundoElemento");
}
