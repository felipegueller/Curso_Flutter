import 'venda_item.dart';
import './cliente.dart';

class Venda {
  Cliente cliente;
  List<VendaItem> itens;

  Venda({this.cliente, this.itens = const []});

  double get valorTotal {
    return itens
        .map((item) => item.preco * item.quantidade) // pega cada item da lista e multiplica pela quantidade
        .reduce((t, a) => t + a); // acumula a soma em t e soma os novos valores disponíveis em a
  }
}
