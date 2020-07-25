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
    print("#\t 4 - Sair             #");
    print("###############################");
    stdout.write("Escolha a opção desejada:");
    opcao = int.parse(stdin.readLineSync());
    switch (opcao) {
      case 1:
        if (!c1.estaNoLimite()) {
          velocidade = c1.acelerar();
          print("Sua velocidade atual é $velocidade km/h.");
          if (c1.estaNoLimite()) {
            print("Você atingiu a velocidade máxima!");
          }
          break;
        } else {
          velocidade = c1.acelerar();
          print(
              "Você atinjiu a velocidade máxima, sua velocidade atual é ${c1.velocidadeAtual}.");
          break;
        }
        break;
      case 2:
        if (!(c1.velocidadeAtual <= 0)) {
          velocidade = c1.frear();
          print("Sua velocidade atual é $velocidade km/h.");
          break;
        } else {
          print("Sua velocidade atual é ${c1.velocidadeAtual} km/h.");
        }
        break;
      case 3:
        if (c1.estaNoLimite()) {
          print("Você atinjiu a velocidade máxima de ${c1.velocidadeMaxima} km/h!");
          break;
        } else {
          print(
              "Você ainda não atinjiu a velocidade máxima, sua velociade é ${c1.velocidadeAtual} km/h.");
          break;
        }
        break;
      case 4:
        print("Saindo!");
        break;
      default:
        print("Opção inválida!");
        break;
    }
    print("");
  } while (opcao != 4);
}
