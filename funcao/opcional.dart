import 'dart:math';

main() {
  int n1 = numeroAleatorio(101);
  print(n1);

  int n2 = numeroAleatorio();
  print(n2);

  imprimirData(13, 03, 1945);
  imprimirData(23, 06);
  imprimirData(31);
  imprimirData();
}

// Quando você coloca o parâmetro entre colchetes ele passa a ser opcional;
// na frente você declara o valor padrão
int numeroAleatorio([int maximo = 11]) {
  return Random().nextInt(maximo);
}

//Paramêtros opcionais
imprimirData([int dia = 1, int mes = 1, int ano = 1970]) {
  print("$dia/$mes/$ano");
}
