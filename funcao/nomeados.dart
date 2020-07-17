main(List<String> args) {
  saudarPessoa(nome: "João", idade: 33);
  saudarPessoa(idade: 33, nome: "Maria");

  imprimirData(7);
  imprimirData(24,ano: 2021);
  imprimirData(14, mes: 12);
}

saudarPessoa({String nome, int idade}) {
  print("Olá $nome, parece que você tem $idade anos.");
}

// pode-se forçar a exigencia de um parâmetro removendo ele das chaves e tirando o seu default
imprimirData(int dia, {int mes = 1, int ano = 1970}) {
  print("$dia/$mes/$ano");
}
