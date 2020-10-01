import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(
            // constraints tem acesso as dimensões do componente
            builder: (ctx, constraints) {
              return Column(
                children: [
                  const SizedBox(
                    // Widget utilizado para dar espaço entre estruturas
                    height: 20,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context)
                        .textTheme
                        .headline6, // Aplicando os estilos de texto por referência
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit
                          .cover, // esssa propriedade alinha a imagem em cima de um elemento com dimensões definidas, no caso dentro da altura do container
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length, // Quantidade de itens da lista
            itemBuilder: (ctx, index) {
              // (itemBuilder)Só chama isso no momento que ele for precisando da informação, renderizar a lista toda de uma vez, o que atrapalha a performance do App
              final tr = transactions[index]; // recebe objeto transaction
              return TransactionItem(
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
