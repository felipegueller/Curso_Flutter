import 'package:flutter/material.dart';
import './adaptative_button.dart';
import './adaptative_textfield.dart';
import './adptative_date_picker.dart';

/* Essa classe tem que extender Stateful por que os componentes controles tem a sua mudança interna */
class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime)
      onSubmit; // quando o formulário for submetido

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    // converta o valor para um double, se não conseguir para 0.0
    final value = double.tryParse(_valueController.text) ?? 0.0;

    // Se os dados estiverem inválidos, não retornar nada
    if (title.isEmpty || value <= 0.0 || _selectedDate == null) {
      return;
    }

    // O atributo 'widget' herdado por herança, é responsável por permitir o acesso aos dados de entrada da classe StateFul endo utilizados na classe State.
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    print('build() TransactionForm');
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm,
                label: 'Título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyBoardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm,
                label: 'Valor (R\$)',
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Eixo principal da Row ( Eixo X)
                children: [
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
