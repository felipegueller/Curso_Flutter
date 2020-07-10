main(List<String> args) {

  int a = 3;
  int b = 4;

  // Operadores unários
  a++; // Posfix
  a--; // Prefix

  print(a);

  print( a++ == --b);
  print(a == b);

  print(!true);
  print(!false);

  bool x = false;
  print(!x);
}