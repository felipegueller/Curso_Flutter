import 'dart:io';

main(List<String> args) {
    
  print("Está chovendo? (s/n)"); 
  bool estaChovendo = stdin.readLineSync() == "s";

  print("Está Frio? (s/n)");
  bool estaFrio = stdin.readLineSync() == "s";
  
  String resultado = estaChovendo || estaFrio ? "Ficar em casa!" : "Vamos sair!";
  print(resultado);
  

}