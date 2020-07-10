main(List<String> args) {
    var n1 = 32.43;
    var n2 = 2;
    var texto = "O reseultado da multiplicação é: ";
    
    // tem que usar o método toString nesse caso;
    print(texto + (n1 * n2).toString());

    print(n1.runtimeType);
    print(texto.runtimeType);
    print(texto is int);

}