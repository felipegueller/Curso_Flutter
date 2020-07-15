import 'dart:io';

main(List<String> args) {
  var digitado = "";

  // sai do laço quando a expressão for verdadeira
  // quantidade inderteminada de repetições 
  while (digitado != "sair") {
    stdout.write("digite algo ou sair: ");
    digitado = stdin.readLineSync();
  }

  print("Você saiu do laço WHILE!");

  // Pelo menos uma vez o bloco será executado
  do{
    stdout.write("digite algo ou sair: ");
    digitado = stdin.readLineSync();
  }while(digitado != "sair");

  print("Você saiu do laço DO/WHILE!");

}
