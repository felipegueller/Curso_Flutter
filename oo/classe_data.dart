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

  void imprimirData() {
    print("${this.dia}/${this.mes}/${this.ano}");
  }
}

main(List<String> args) {
  var dataAniversario = new Data();
  dataAniversario.dia = 13;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2020;

  // maneira pouco usual
  print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");

  var dataCompra = new Data();
  dataCompra.dia = 12;
  dataCompra.mes = 10;
  dataCompra.ano = 2021;

  dataCompra.imprimirData();
}
