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
  var resultado = alunos.map(pegarApenasONome).map(qtdDeLetras).map(dobro);

  print(resultado);

  var itensDeCompra = [
    {'Produto': 'Arroz', 'Preço': 22.76},
    {'Produto': 'Feijão', 'Preço': 13.22},
    {'Produto': 'Banana', 'Preço': 4.59},
    {'Produto': 'Amendoim', 'Preço': 3.79},
    {'Produto': 'Suco de Laranja', 'Preço': 5.99},
    {'Produto': 'Chocholate', 'Preço': 12.99},
  ];

  String Function(Map) pegarNomeDosItens = (produto) => produto['Produto'];
  var nomeItens = itensDeCompra.map(pegarNomeDosItens);
  print(nomeItens);

  // Exemplo básico usando Map e reduce
  var valorTotalCompra = itensDeCompra
      .map((item) => item[
          'Preço']) // obetendo somente os valores de cada item na lista de maps
      .map((item) => (item as double)
          .roundToDouble()) // convertendo os valores do tipo Obeject para Double
      .reduce((acumulador, elementoAtual) =>
          acumulador +
          elementoAtual); // obtendo o total atráves da função reduce

  print(valorTotalCompra);

  var carros = {'Ferrari', 'Corolla', 'City', 'Uno', 'Porsche'};
  int Function(String) qtdLetras = (carro) => carro.length;
  var qtdLetrasCarro = carros.map(qtdLetras);
  print(qtdLetrasCarro);
}
