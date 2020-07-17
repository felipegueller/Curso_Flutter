main(List<String> args) {
  // tipo nome = valor;
  int Function(int, int) soma1 = somaFn;
  print(soma1(2, 3));

  int Function(int, int) soma2 = (x, y) {
    return x + y;
  };
  print(soma2(32, 32));
  
  // Por inferência
  var soma3 = (x, y) {
    return x + y;
  };
  print(soma2(2, 2));
}

int somaFn(int a, int b) {
  return a + b;
}
