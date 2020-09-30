import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'; // Pacote responsável pela formatação da data

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            // constraints tem acesso as dimensões do componente
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(
                    // Widget utilizado para dar espaço entre estruturas
                    height: 20,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context)
                        .textTheme
                        .headline6, // Aplicando os estilos de texto por referência
                  ),
                  SizedBox(height: 20),
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
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  // Widget especialista em listas
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        // FittedBox -> Garante que os valores sejam alinhados
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title, // title da transaction
                    // estilo definido para títulos
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          label: Text('Excluir'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          //Botão para remover uma transação da lista
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
            },
          );
  }
}
