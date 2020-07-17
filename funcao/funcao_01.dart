import 'dart:math';

void main() {
  int a = 2;
  int b = 3;
  //print(a + b);
  somaComPrint(a, b);

  int c = 4;
  int d = 6;
  //print(c + d);
  somaComPrint(c, d);

  somaComPrint(d, int.parse("8"));

  somaDoisNumerosQuaisquer();
}

void somaComPrint(int a, int b) {
  print(a + b);
}

void somaDoisNumerosQuaisquer() {
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);
  print("os vallores sorteados foram $a e $b");
  print("$a + $b = ${a + b}");
}
