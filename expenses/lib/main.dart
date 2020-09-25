import 'package:flutter/material.dart'; // importando o material desing
import './components/transaction_user.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
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
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
