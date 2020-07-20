import 'dart:math';

// função recebendo como parâmetro outra função!
void executar({Function fnPar, Function fnImpar}) {
  var sorteado = Random().nextInt(10);
  print("O valor sorteado foi $sorteado");
  sorteado % 2 == 0 ? fnPar() : fnImpar();
}

main(List<String> args) {
  var minhaFnPar = () => print("Eita! O valor é par!");
  var minhaFnImpar = () => print("Eita! O valor é impar!");

  executar(fnPar: minhaFnPar, fnImpar: minhaFnImpar);
}
