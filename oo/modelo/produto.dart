class Produto {
  int codigo;
  String nome;
  double preco;
  double desconto;

  Produto({this.codigo, this.preco, this.nome, this.desconto = 0});

  double get precoComDescoto{
    return (1 - this.desconto) * this.preco;
  }
}
