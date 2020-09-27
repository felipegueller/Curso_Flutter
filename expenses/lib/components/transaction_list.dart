import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'; // Pacote responsável pela formatação da data

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // tamanho do container
      // O ListView precisa ter um componente pai para definir o scroll
      child: transactions.isEmpty
          ? Column(
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
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit
                        .cover, // esssa propriedade alinha a imagem em cima de um elemento com dimensões definidas, no caso dentro da altura do container
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length, // Quantidade de itens da lista
              itemBuilder: (ctx, index) {
                // (itemBuilder)Só chama isso no momento que ele for precisando da informação, renderizar a lista toda de uma vez, o que atrapalha a performance do App
                final tr = transactions[index]; // recebe objeto transaction
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
                            color: Theme.of(context)
                                .primaryColor, // cor da borda conforme a cor estabelecida no tema
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
                            color:
                                Theme.of(context).primaryColor, // cor da fonte
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Eixo cruzado da Column (Eixo x)
                        children: <Widget>[
                          Text(
                            tr.title, // Titulo da transação
                            style: Theme.of(context)
                                .textTheme
                                .headline6, // obetendo as configuraçõse estabelecidas no Material e aplicando ao título
                            // style: TextStyle(
                            //   fontSize: 16, // Tamanho da fonte
                            //   fontWeight: FontWeight.bold, // Peso da fonte
                            // ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(
                                tr.date), // Permite a formatação da data
                            style: TextStyle(
                              color: Colors.grey, // cor do texto
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
