main(List<String> args) {
  saudarPessoa(nome: "João", idade: 33);
  saudarPessoa(idade: 33, nome: "Maria");
  saudarPessoa(nome: 'Felipe', idade: 22);

  imprimirData(7);
  imprimirData(24, ano: 2021);
  imprimirData(14, mes: 12);

  imprimirEndereco(
    logradouro: "Rua dos papagáios",
    bairro: "Santo Languinho",
    numero: 443,
    complemento: "Perto da fármacia do Turco",
  );
}

saudarPessoa({String nome, int idade}) {
  print("Olá $nome, nem parece que você tem $idade anos.");
}

// pode-se forçar a exigencia de um parâmetro removendo ele das chaves e tirando o seu default
imprimirData(int dia, {int mes = 1, int ano = 1970}) {
  print("$dia/$mes/$ano");
}

void imprimirEndereco(
    {String logradouro, String bairro, int numero, String complemento}) {
  print(
      "Logradouro: $logradouro \nBairro: $bairro \nNúmero: $numero \nComplemento: $complemento");
}
