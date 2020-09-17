/* Função que executa outra por qtd de vezes */
int executarPor(int qtd, String Function(String) fn, String valor) {
  String textoCompleto = "";
  for (int i = 0; i < qtd; i++) {
    textoCompleto += fn(valor);
  }
  return textoCompleto.length;
}

String executarPor2(int qtd, Function(String) fn, String valor) {
  for (int i = 0; i < qtd; i++) {
    fn(valor);
  }
}

main(List<String> args) {
  print("Teste!");
  var meuPrint = (String valor) {
    print(valor);
    return valor;
  };
  int tamanho = executarPor(10, meuPrint, "Muito legal!");
  print("O tamanho da String é $tamanho em caracteres");

  executarPor2(3, print, 'Hello Wolrd!');
}
