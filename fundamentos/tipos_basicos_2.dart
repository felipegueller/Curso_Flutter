/* 
	- List
	- Set 
	- Map
*/
main(List<String> args) {
  var aprovados = ["Ana", "Carlos", "Daniel", "Rafael"];
  print(aprovados is List);
  print(aprovados);
  print(aprovados.elementAt(2));
  print(aprovados[0]);
  aprovados.add("Jorge");
  print("A lista contém o Jorge: " + aprovados.contains("Jorge").toString());

  print("\n\n");

  var telefones = {
    'João': "+55 (11) 98765-4321",
    'Leléto': "+55 (37) 93215-3213",
    'Rafinha': "+55 (41) 96755-4876",
  };

  print(telefones is Map);
  print(telefones);
  print(telefones.remove('Rafinha'));
  print(telefones['+55 (41) 96755-4876']);
  print(telefones['João']);
  print(telefones.length);
  print(telefones.keys); //apenas chaves
  print(telefones.values); // apenas valores
  print(telefones.entries); // chave e valor

  print("\n\n");

  var times = {'Vasco', "Flamengo", "Portuguesa", "Pampulha"};

  print(times);
  print(times.length);
  print(times is Set);
  print(times.contains("Vasco"));
  print(times.first);
  print(times.last);
}
