import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart'; // importando o material desing
import 'package:intl/intl.dart'; // Pacote responsável pela formatação da data

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 320.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 210.31,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        //centerTitle: true, // Define a posição ao centro
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, // Eixo Principal da Column (eixo Y)
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Eixo cruzado da Column (Eixo X)
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue, // cor do Card
              child: Text('Gráfico'), // texto do card
              elevation: 5, // efeito de sombreamento
            ),
          ),
          Column(
            children: _transactions.map((tr) {
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
                      padding: EdgeInsets.all(
                          10), // Padding de 10px para as 4 direções
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
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Eixo cruzado da Column (Eixo x)
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
          ),
        ],
      ),
    );
  }
}
