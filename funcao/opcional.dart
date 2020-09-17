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

  imprimirHora();
  imprimirHora(08);
  imprimirHora(08, 01);
  imprimirHora(08, 01, 09);
  imprimirHora(23, 25, 59);
}

// Quando você coloca o parâmetro entre colchetes ele passa a ser opcional;
// na frente você declara o valor padrão que a variável receberá caso você não passe nenhum valor quando for chamar ela.
int numeroAleatorio([int maximo = 11]) {
  return Random().nextInt(maximo);
}

//Paramêtros opcionais
imprimirData([int dia = 1, int mes = 1, int ano = 1970]) {
  print("$dia/$mes/$ano");
}

void imprimirHora([int hora = 00, int minutos = 00, int segundos = 00]) {
  if (hora < 10 && minutos < 10 && segundos < 10) {
    print("0$hora:0$minutos:0$segundos");
  } else if (hora < 10 && minutos < 10) {
    print("0$hora:0$minutos:$segundos");
  } else if (hora < 10 && segundos < 10) {
    print("0$hora:$minutos:0$segundos");
  } else if (segundos < 10 && hora < 10) {
    print("$hora:0$minutos:0$segundos");
  } else {
    print("$hora:$minutos:$segundos");
  }

  //print("$hora:$minutos:$segundos");
}
