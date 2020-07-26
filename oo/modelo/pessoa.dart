class Pessoa {
  String nome;
  String telefone;
  int idade;

  Pessoa(this.nome, this.telefone, this.idade);

  void apresentarPessoa() {
    print("Nome: ${this.nome} \nTelefone: ${this.telefone} \nIdade: ${this.idade}");
  }
}
