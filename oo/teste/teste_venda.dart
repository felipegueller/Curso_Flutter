import '../modelo/cliente.dart';
import '../modelo/produto.dart';
import '../modelo/venda.dart';
import '../modelo/venda_item.dart';

main() {
  // também pode fazer a composição por variáveis
  var vendaItem1 = new VendaItem(
      quantidade: 40,
      produto: Produto(
          codigo: 32, nome: "Maço de folha A4", preco: 20.00, desconto: 0.05));

  var venda = new Venda(
      // Instâncias de Clientes
      cliente: Cliente(nome: "Felipe Gueller", cpf: "400.028.922-43"),
      // Instância dos itens de venda
      itens: <VendaItem>[
        VendaItem(
          quantidade: 2,
          produto: Produto(
              codigo: 101,
              nome: "Caneta Bic Azul",
              preco: 1.25,
              desconto: 0.12),
        ),
        // criando vários itens de venda dentro da lista da venda
        VendaItem(
            quantidade: 7,
            produto: Produto(
                codigo: 201,
                nome: "Cadernos de 96 folhas",
                preco: 15.98,
                desconto: 0.25)),
        VendaItem(
            // quantidade default
            produto: Produto(codigo: 404, nome: "Mochila Company", preco: 169.46
                //desconto default
                )),
        vendaItem1
      ]);

  print("O valor total da venda: R\$${venda.valorTotal}");

  print("Nome do segundo produto incluso na venda: " +
      " ${venda.itens[1].produto.nome}");

  print("O CPF do cliente: ${venda.cliente.cpf}");

  for (int i = 0; i < venda.itens.length; i++) {
    print("Produto: " + venda.itens[i].produto.nome);
  }

  // var pegarApenasONomeDosProdutos = (nome) => venda.itens[2].produto.nome;
  // var nomesProdutos = venda.itens.map(pegarApenasONomeDosProdutos);
  // print(nomesProdutos);
}
