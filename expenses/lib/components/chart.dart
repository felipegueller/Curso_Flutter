import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    // gerando uma lista definida, com no caso 7 posições
    return List.generate(7, (index) {
      // lógica para pegar os 7 últimos dias da semana dinamicamente
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E()
            .format(weekDay)[0], // Pegando a primeira letra do dia da semana
        'value': totalSum,
      };
      // reversed vai reverter a posição da lista
    }).reversed.toList();
  }

  // retorna o valor total da semana
  double get _weekTotalValue {
    return groupedTransactions.fold(0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        // adicionando um padding dentro do conteúdo do Card
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit
                  .tight, // Divide os espaço entre os elementos de forma mais rigorosa(iguais)
              child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                percentage: _weekTotalValue == 0
                    ? 0
                    : (tr['value'] as double) /
                        _weekTotalValue, // retorna a porcentagemem cima do valor do dia / total semena
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
