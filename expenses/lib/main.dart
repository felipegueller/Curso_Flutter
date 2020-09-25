import 'package:expenses/models/transaction.dart';
import 'package:expenses/models/transation_form.dart';
import 'package:flutter/material.dart'; // importando o material desing
import './components/transaction_list.dart';

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
          TransactionList(_transactions),
          TransactionForm(),
        ],
      ),
    );
  }
}
