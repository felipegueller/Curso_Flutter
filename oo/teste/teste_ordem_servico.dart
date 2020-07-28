import '../modelo/cliente.dart';
import '../modelo/item_os.dart';
import '../modelo/item_servico.dart';
import '../modelo/ordem_servico.dart';
import '../modelo/produto.dart';
import '../modelo/servico.dart';

main(List<String> args) {
  var os = OrdemServico(
      cliente: Cliente(nome: "Alfredo Chaves", cpf: "232.321.543-09"),
      itensOS: <ItemOS>[
        ItemOS(
            quantidade: 1,
            servico: Servico(
                codigo: 23,
                nome: "Troca de Pneus",
                desconto: 0.05,
                preco: 50.00,
                itensServico: <ItemServico>[
                  ItemServico(
                      quantidade: 4,
                      produto: Produto(
                        codigo: 12,
                        nome: "Pneu Pirelli",
                        preco: 300.00,
                        desconto: 213.32,
                      ))
                ]))
      ]);

  print("O valor total da ordem de servico: ${os.valorTotal}");
}
