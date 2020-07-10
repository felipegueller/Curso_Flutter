main(){

  //Aritiméticos (binários / infix)
  int a = 7;
  int b = 3;
  int resultado = a + b;

  print(resultado);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a % b); // resto da operação

  // Operadores lógicos
  bool ehFragil = true;
  bool ehCaro = false;

  print("Produto frágil e caro? " + (ehFragil && ehCaro).toString()); // E ( AND )
  print("Produto frágil ou caro? " + (ehFragil || ehCaro).toString()); // OU ( OR )
  print("Produto frágil ^ caro? " + (ehFragil ^ ehCaro).toString()); // OU EXCLUSÍVO ( XOR )
  print("Não é Frágil? "+ (!ehFragil).toString()); // NOT -> Unário/Prefix
  print("É caro? "+ (!!ehCaro).toString()); // DOUBLE NOT
}