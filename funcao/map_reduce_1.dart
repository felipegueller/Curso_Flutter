main(List<String> args) {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Abilibob', 'nota': 6.9},
    {'nome': 'Carvanhas', 'nota': 7.4},
    {'nome': 'Defrades', 'nota': 4.3},
    {'nome': 'Eclides', 'nota': 8.2},
    {'nome': 'Fertenanho', 'nota': 2.7},
  ];
  /* Esta função recebe um elemento do tipo Map, e retorna ele como uma String. Mais especificamente
     O valor da chave 'nome' */
  String Function(Map) pegarApenasONome = (aluno) => aluno['nome'];
  int Function(String) qtdDeLetras = (texto) => texto.length;
  int Function(int) dobro = (numero) => numero * 2;
  // o objetivo da função map é transformar um elemento em outro
  var resultado = alunos
  .map(pegarApenasONome)
  .map(qtdDeLetras)
  .map(dobro);

  print(resultado);
}
