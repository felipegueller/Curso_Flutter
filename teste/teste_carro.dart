import 'dart:io';

import '../oo/carro.dart';

main(List<String> args) {
  int velMaxima;
  int opcao;
  int velocidade = 0;
  stdout.write("Informe a velocidade máxima do carro:");
  velMaxima = int.parse(stdin.readLineSync()).floor();
  Carro c1 = new Carro(velMaxima);

  do {
    print("###############################");
    print("#\t 1 - Acelerar         #");
    print("#\t 2 - Frear            #");
    print("#\t 3 - Está no limite?  #");
    print("#\t 4 - Freada brusca    #");
    print("#\t 5 - Sair             #");
    print("###############################");
    stdout.write("Escolha a opção desejada:");
    var aux = stdin.readLineSync();
    // teste para garantir que o programa continue executando, caso não digite nenhuma opção.
    if (aux != "") {
      opcao = int.parse(aux);
    } else {
      opcao = -1;
    }
    switch (opcao) {
      case 1:
        if (!c1.estaNoLimite()) {
          velocidade = c1.acelerar();
          print("Sua velocidade atual é $velocidade km/h.");
          if (c1.estaNoLimite()) {
            print("Você atingiu a velocidade máxima!");
          }
        } else {
          velocidade = c1.acelerar();
          print(
              "Você atinjiu a velocidade máxima, sua velocidade atual é ${c1.velocidadeAtual}.");
        }
        break;
      case 2:
        if (!(c1.velocidadeAtual <= 0)) {
          velocidade = c1.frear();
          print("Sua velocidade atual é $velocidade km/h.");
        } else {
          print("Sua velocidade atual é ${c1.velocidadeAtual} km/h.");
        }
        break;
      case 3:
        if (c1.estaNoLimite()) {
          print(
              "Você atinjiu a velocidade máxima de ${c1.velocidadeMaxima} km/h!");
        } else {
          print(
              "Você ainda não atinjiu a velocidade máxima, sua velociade é ${c1.velocidadeAtual} km/h.");
        }
        break;
      case 4:
        print("A velocidade atual está em ${c1.velocidadeAtual} km/h.");
        if (c1.velocidadeAtual == 0) {
          print("O carro já está parado!!");
        } else if (c1.velocidadeAtual >= 100) {
          print("Pisando com tudo no freio!!!!");
          for (String s = "."; s != "......"; s += ".") {
            print("$s");
            sleep(const Duration(seconds: 1));
          }
          velocidade = c1.freadaBrusca();
          print("O carro parou, sua velocidade agora é de $velocidade km/h.");
        } else {
          print("Pisando com tudo no freio!!!!");
          for (String s = "."; s != "..."; s += ".") {
            print("$s");
            sleep(const Duration(seconds: 1));
          }
          velocidade = c1.freadaBrusca();
          print("O carro parou, sua velocidade agora é de $velocidade km/h.");
        }
        break;
      case 5:
        print("Saindo!");
        break;
      default:
        print("Opção inválida!");
        break;
    }
    print("");
  } while (opcao != 5);
}
