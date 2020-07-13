import 'dart:math';

main() {
  var nota = Random().nextInt(11); // range vai de 0 a 10, excluindo o 11;
  print("Nota selecionada foi $nota.");

  if (nota >= 7) {
    print("Aprovado!");
  } else if (nota >= 5 || nota < 7) {
    print("Recuperação!");
  } else {
    print("Reprovado!");
  }

  print("Fim!");
}
