import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                // FittedBox -> Garante que os valores sejam alinhados, ou seja, não deixa empurrar a barra para baixo
                child: Text('${value.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              // representa a barra de progresso
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment
                    .bottomCenter, // Permite a barra ser preenchida de baixo para cima
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    // Este componente permite ocupar o mesmo espaço utilizado pela Stack
                    heightFactor:
                        percentage, // Está propriedade irá fazer a barra ser preenchida conforme a porcentagem
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              // FittedBox garante que o texto irá se reajustar sem quebar a tela
              child: FittedBox(
                child: Text(label), // representa a sigla do dia da semana
              ),
            ),
          ],
        );
      },
    );
  }
}
