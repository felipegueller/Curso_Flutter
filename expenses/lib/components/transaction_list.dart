import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'; // Pacote responsável pela formatação da data

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        // children recebe direto uma lista de transaction
        // tr -> represensa uma instância de transaction
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  // pesquisar sobre
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  // (BoxDecoration) Widget que permite mexer com a borda do container
                  border: Border.all(
                    color: Colors.purple, // cor da borda
                    width: 2, // largura da borda
                  ),
                ),
                padding:
                    EdgeInsets.all(10), // Padding de 10px para as 4 direções
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}', // toStringAsFixed permite definir a quantidade de casas decimais
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // peso da fonte
                    fontSize: 20, // tamanho da fonte
                    color: Colors.purple, // cor da fonte
                  ),
                ),
              ),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Eixo cruzado da Column (Eixo x)
                children: <Widget>[
                  Text(
                    tr.title, // Titulo da transação
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte
                      fontWeight: FontWeight.bold, // Peso da fonte
                    ),
                  ),
                  Text(
                    DateFormat('d MMM y')
                        .format(tr.date), // Permite a formatação da data
                    style: TextStyle(
                      color: Colors.grey, // cor do texto
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
