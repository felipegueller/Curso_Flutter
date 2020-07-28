import './item_servico.dart';
class Servico {
  int codigo;
  String nome;
  double preco;
  double desconto;
  List<ItemServico> itensServico;

  Servico({this.codigo, this.desconto = 0, this.nome, this.preco,this.itensServico = const[] });

  double get precoComDescoto {
    return (1 - this.desconto) * this.preco;
  }
}
