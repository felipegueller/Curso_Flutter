main(List<String> args) {
  /* var adicao = (int a, int b) {
    return a + b;
  };*/

  //return implícito
  var adicao = (int a, int b) => a + b;
  var subtracao = (int a, int b) => a - b;
  var multiplicao = (int a, int b) => a * b;
  var divisao = (int a, int b) => a / b;
  var restoDivisao = (int a) => a % 2;

  print(adicao(4, 19));
  print(subtracao(9, 3));
  print(multiplicao(4, 3));
  print(divisao(12, 3));
  print(restoDivisao(19));

  var concat = (String s1, String s2) => "$s1 $s2";
  print(concat("Hello", "World!"));

  // Função anônima do tipo Arrow
  var nomeCompleto =
      ({String nome, String sobrenome}) => nome + " " + sobrenome;
  print(nomeCompleto(nome: 'Felipe', sobrenome: "Gueller"));
}
