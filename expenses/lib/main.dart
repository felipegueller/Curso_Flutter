import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart'; // importando o material desing
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import './components/chart.dart';
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
        fontFamily: 'Quicksand', // definindo a fonte padrão da aplicação
        textTheme: TextTheme(
          // aplicando essas configurações para todo app que usa a referência headline6
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            // Aplicando estilo padrão para todos os botões da aplicação
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            // mudando o título do Appbar (Definindo referências)
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        accentColor: Colors.amber,
        // Aplicação de cores para botões flutuantes
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7), // pegando a data atual e subtraindo 7 dias
      ));
    }).toList();
  }

  // Função responsavel por adicionar uma transação a lista de transações
  _addTransaction(String newTitle, double newValue, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: newTitle,
      value: newValue,
      date: date,
    );

    setState(() {
      _transactions
          .add(newTransaction); // Adicionando uma nova transação a lista
    });

    // Fechando o modal a após o subimit do formulário
    Navigator.of(context).pop();
  }

  // deleta uma transação da lista
  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
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
            Chart(_recentTransaction), // Widget do gráfico
            TransactionList(
                _transactions, _removeTransaction), // Lista de Transações
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
