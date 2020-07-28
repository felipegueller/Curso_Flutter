import '../modelo/produto.dart';
import '../modelo/servico.dart';
import '../modelo/item_servico.dart';

main(List<String> args) {
  var servico = Servico(
      codigo: 12,
      nome: "Troca de Pneus",
      preco: 50.00,
      desconto: 0.10,
      itensServico: <ItemServico>[
        ItemServico(
            quantidade: 4,
            produto: Produto(
                codigo: 23,
                nome: "Pneu Pirelli",
                preco: 300.00,
                desconto: 0.05))
      ]);

  print("Valor total do serviço: ${servico.valorTotalItens}");
}
