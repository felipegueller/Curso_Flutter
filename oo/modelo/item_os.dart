import 'servico.dart';

class ItemOS {
  int quantidade;
  double _preco;
  Servico servico;

  ItemOS({this.quantidade = 1, this.servico});

  double get preco {
    if (servico != null && _preco == null) {
      _preco = servico.precoComDescoto + servico.valorTotalItens;
    }
    return _preco;
  }

  void set preco(double novoPreco) {
    if (novoPreco > 0) {
      _preco = novoPreco;
    }
  }
}
