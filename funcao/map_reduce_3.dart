main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Abilibob', 'nota': 6.9},
    {'nome': 'Carvanhas', 'nota': 7.4},
    {'nome': 'Defrades', 'nota': 4.3},
    {'nome': 'Eclides', 'nota': 8.2},
    {'nome': 'Fertenanho', 'nota': 2.7},
  ];

  /* A var total recebe a nota de todos os calunos */
  var notasFinais = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double)
          .roundToDouble()) // essa parte serve apenas para coverter de object para double
      .where((nota) => nota >= 8);
    
    var total = notasFinais.reduce((t, a) => t + a);

  print("O valor da média é: ${total / notasFinais.length}");
}
