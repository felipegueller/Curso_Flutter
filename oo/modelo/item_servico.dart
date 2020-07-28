import './produto.dart';

class ItemServico{
  int quantidade;
  double _preco;
  Produto produto;

  ItemServico({this.quantidade = 1, this.produto});

  double get preco {
    if (produto != null && _preco == null) {
      _preco = produto.precoComDescoto;
    }
    return _preco;
  }

  void set preco(double novoPreco) {
    if (novoPreco > 0) {
      _preco = novoPreco;
    }
  }
}