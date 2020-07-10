main(List<String> args) {
  
  String nome = "Felipe";
  String status = "aprovado";
  double nota = 9.2;

  String frase = nome + " está " + status +" porque tirou a nota " + nota.toString() + "!";

  //usando interpolação
  String frase2 = "$nome está $status pq tirou nota $nota!";
  String frase3 = "\$nome está $status pq tirou nota $nota!"; //deixa de interpretar o nome como váriavel
  
  print(frase);
  print(frase2);
  print(frase3);

  // como realizar operações com interpolação
  print("20 * 20 = ${20 * 20}");
}