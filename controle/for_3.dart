main(List<String> args) {
  Map<String, double> notas = {
    'João Pedro': 9.1,
    'Ana Silva': 8.3,
    'Tony Léleto': 9.5,
    'Vigo Abner': 3.2,
    'Jepeto Vassoura': 4.9,
    'Sarney Urába': 5.23
  };

  for (String nome in notas.keys) {
    print("Nome do aluno é $nome e a nota é ${notas[nome]}");
  }

  for (var nota in notas.values) {
    print("A nota é $nota ");
  }

  for (var registro in notas.entries) {
    print("O ${registro.key} tem a nota ${registro.value};");
  }
}
