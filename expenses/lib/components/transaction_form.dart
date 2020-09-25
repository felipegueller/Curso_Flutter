import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double)
      onSubmit; // quando o formulário for submetido

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    // converta o valor para um double, se não conseguir para 0.0
    final value = double.tryParse(valueController.text) ?? 0.0;

    // Se os dados estiverem inválidos, não retornar nada
    if (title.isEmpty || value <= 0.0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(
            10), // espaçamento interno utilizando o widget Padding
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // Adicionando o teclado de numérico
              onSubmitted: (_) =>
                  _submitForm(), // onSubmitted precisa de uma void Function(String)
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Eixo principal da Row ( Eixo X)
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
