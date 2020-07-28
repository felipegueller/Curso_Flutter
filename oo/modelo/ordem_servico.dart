import './cliente.dart';
import './item_os.dart';

class OrdemServico {
  Cliente cliente;
  List<ItemOS> itensOS;

  OrdemServico({this.cliente, this.itensOS = const[]});

  double get valorTotal {
    return itensOS
        .map((itemOS) => itemOS.preco * itemOS.quantidade) // pega cada item da lista e multiplica pela quantidade
        .reduce((t, a) => t + a); // acumula a soma em t e soma os novos valores disponíveis em a
  }
}
