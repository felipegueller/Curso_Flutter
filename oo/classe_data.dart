class Data {
  int dia;
  int mes;
  int ano;

  // Construtor Padrão
  Data() {}

  /*Data(int dia, int mes, int ano) {
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }
  */

  String imprimirDataFormatada() {
    return "${this.dia}/${this.mes}/${this.ano}";
  }

  // chamado automaticamente quando escreve apenas o nome da instância
  String toString() {
    //return "${this.dia}/${this.mes}/${this.ano}";
    return imprimirDataFormatada();
  }
}

main(List<String> args) {
  var dataAniversario = new Data();
  dataAniversario.dia = 13;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2020;

  // maneira pouco usual
  // print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");
  String d1 = dataAniversario.imprimirDataFormatada();

  var dataCompra = new Data();
  dataCompra.dia = 12;
  dataCompra.mes = 10;
  dataCompra.ano = 2021;

  print("A data de aniversario é $d1");
  print("A data da compra foi ${dataCompra.imprimirDataFormatada()}");

  // Depois de implementar o método toString
  // pode ser explicíto ou implícito
  print(dataAniversario);
  print(dataCompra.toString());
}
