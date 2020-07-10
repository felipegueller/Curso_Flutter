import 'dart:io';

main(List<String> args) {
  //Área da circunferência = PI * raio * raio
  
  //final double PI = 3.1415; // constante
  const double PI = 3.1415;// constante

  //print("Informe o valor do raio: ");
  stdout.write("informe o valor do raio: ");
  var entradaDoUsuario = stdin.readLineSync();
  double raio = double.parse(entradaDoUsuario);

  double area = PI * raio * raio;

  print("O valor da área é: " + area.toString());
}