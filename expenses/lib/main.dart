import 'dart:math';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // importando o material desing

import './components/transaction_form.dart';
import './components/transaction_list.dart';
import './components/chart.dart';
import './models/transaction.dart';

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
              // textScaleFactor aumenta a resposividade da fonte médiante as configurações de acessibilidade presentes no dispositivo do usuário
              fontSize: 20 /*  * MediaQuery.of(context).textScaleFactor*/,
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
  bool _showChart = false;

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

  Widget _getIconButton(IconData icon, Function fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    print('build() MyHomePageState');
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final iconChart =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final actions = <Widget>[
      if (isLandscape)
        _getIconButton(_showChart ? iconList : iconChart, () {
          setState(
            () {
              _showChart = !_showChart;
            },
          );
        }),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Despesas Pessoais'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          )
        : AppBar(
            title: Text('Despesas Pessoais'),
            actions: actions,
            //centerTitle: true, // Define a posição ao centro
          );

    // Altura total da tela - altura appBar - altura da barra de Status
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        // habilita o scroll(rolagem) na tela
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Eixo cruzado da Column (Eixo X)
          children: <Widget>[
            // if (isLandscape)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Exibir Gráfico'),
            //       Switch.adaptive(
            //         activeColor: Theme.of(context).accentColor,
            //         value: _showChart,
            //         onChanged: (value) {
            //           setState(() {
            //             _showChart = value;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            if (_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 0.8 : 0.3),
                child: Chart(_recentTransaction),
              ),
            if (!_showChart || !isLandscape)
              // Widget do gráfico
              Container(
                height: availableHeight *
                    (isLandscape ? 1 : 0.7), // altura resposiva
                child: TransactionList(_transactions, _removeTransaction),
              ), // Lista de Transações
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar, // váriavel final
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(
                        context), // context direto do método build
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
