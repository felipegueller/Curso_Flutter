class Carro {
  int velocidadeMaxima;
  int velocidadeAtual = 0;

  Carro(int velocidadeMaxima) {
    this.velocidadeMaxima = velocidadeMaxima;
  }

  bool estaNoLimite() {
    if (this.velocidadeAtual == this.velocidadeMaxima) {
      return true;
    } else {
      return false;
    }
  }

  int acelerar() {
    if (estaNoLimite()) {
      return this.velocidadeAtual;
    } else {
      this.velocidadeAtual += 5;
      return this.velocidadeAtual;
    }
  }

  int frear() {
    if (this.velocidadeAtual <= 0) {
      return this.velocidadeAtual;
    } else {
      this.velocidadeAtual -= 5;
      return this.velocidadeAtual;
    }
  }
}
