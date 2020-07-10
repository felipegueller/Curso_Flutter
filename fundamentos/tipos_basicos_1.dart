/*
    - Números(int e double)
    - String (String)
    - Boolean (bool)
	- Dynamic
 */

main(List<String> args) {

	//Tipo inteiro
	int n1 = 3;

	//Tipo decimal
	double n2 = (-5.67).abs(); // abs - retorna o valor de forma positiva
	double n3 = double.parse("12.43");

	print(n1 * n2 * n3);
	
	//Tipo String
	String s1 = "Bom";
	String s2 = "dia";
	
	print((s1 + " "+ s2).toUpperCase() + "!!!");

	// Tipo Boleano
	bool estaChovendo = false;
	bool muitoFrio = true;

	print(estaChovendo ^ muitoFrio);

	// Tipo Dinâmico
	dynamic x = "Um texto bem legal!!";
	x = 123;
	x = true;
  print(x);

}