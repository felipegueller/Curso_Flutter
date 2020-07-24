class Data {
  int dia;
  int mes;
  int ano;

  /*
  // Construtor Padrão
  Data() {}
  */

  /*
  Data(int dia, int mes, int ano) {
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }
  */

  Data([this.dia = 01, this.mes = 01, this.ano = 1970]);

  //Construtor nomeado
  Data.com({this.dia = 1, this.mes = 1, this.ano = 1970});
  Data.ultimoDiaDoAno(int ano) {
    this.dia = 31;
    this.mes = 12;
    this.ano = ano;
  }

  String imprimirDataFormatada() {
    if (dia < 10 && mes < 10) {
      return "0${this.dia}/0${this.mes}/${this.ano}";
    } else if (dia < 10 && mes >= 10) {
      return "0${this.dia}/${this.mes}/${this.ano}";
    } else if (dia >= 10 && mes < 10) {
      return "${this.dia}/0${this.mes}/${this.ano}";
    } else {
      return "${this.dia}/${this.mes}/${this.ano}";
    }
  }

  // chamado automaticamente quando escreve apenas o nome da instância
  String toString() {
    //return "${this.dia}/${this.mes}/${this.ano}";
    return imprimirDataFormatada();
  }
}

main(List<String> args) {
  var dataAniversario = new Data(13, 12, 2020);
  dataAniversario.dia = 13;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2020;

  // maneira pouco usual
  // print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");
  String d1 = dataAniversario.imprimirDataFormatada();

  var dataCompra = new Data(11, 10, 2021);
  //dataCompra.dia = 12;
  dataCompra.mes = 10;
  dataCompra.ano = 2021;

  print("A data de aniversario é $d1");
  print("A data da compra foi ${dataCompra.imprimirDataFormatada()}");

  // Depois de implementar o método toString
  // pode ser explicíto ou implícito
  print(dataAniversario);
  print(dataCompra.toString());

  print(new Data());
  print(new Data(15));
  print(new Data(26, 07));
  print(new Data(04, 08, 2012));

  print(new Data.com(ano: 2022));

  var dataFinal = Data.com(dia: 12, mes: 03, ano: 2024);

  print("O Mickey será publico na data de $dataFinal");

  print(new Data.ultimoDiaDoAno(2025));
}
