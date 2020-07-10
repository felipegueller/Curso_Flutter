main(){

  var listaCoisas = ["Banana", true, 4, 5.4, [1, 3, 2]];
  print(listaCoisas);

  List<String> listaComGenerics = ["Alfredo", "Avião", "Pardal"];
  listaComGenerics.add("Lorax");

  print(listaComGenerics);

  Map <String , double> salarios = {
    "gerente": 3400.32,
    "vendedor": 2004.53,
    "estágiario" : 600.00
  };

  print(salarios);

}