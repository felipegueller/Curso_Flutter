import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart'; // importando o material desing
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:math';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        // primarySwatch recebe um conjunto de cores dentro de um exprectro
        primarySwatch: Colors
            .purple, // recebe uma lista de cores, neste caso uma lista de roxo
        accentColor: Colors
            .amber, // recebe apenas uma cor, que passa a ser a cor de realse da aplicação
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  // Função responsavel por adicionar uma transação a lista de transações
  _addTransaction(String newTitle, double newValue) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: newTitle,
      value: newValue,
      date: DateTime.now(),
    );

    setState(() {
      _transactions
          .add(newTransaction); // Adicionando uma nova transação a lista
    });

    // Fechando o modal a após o subimit do formulário
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(
                context), // context direto do método build
          ),
        ],
        //centerTitle: true, // Define a posição ao centro
      ),
      body: SingleChildScrollView(
        // habilita o scroll(rolagem) na tela
        child: Column(
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
            TransactionList(_transactions), // Lista de Transações
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(
            context), // context direto do método build
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
