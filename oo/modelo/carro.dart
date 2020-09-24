class Carro {
  final int velocidadeMaxima;
  int _velocidadeAtual = 0;

  Carro(this.velocidadeMaxima);

  int get velocidadeAtual {
    return this._velocidadeAtual;
  }

  void set velocidadeAtual(int velocidadeAtual) {
    bool deltaValido = (this._velocidadeAtual - velocidadeAtual).abs() <= 5;
    if (deltaValido) {
      this._velocidadeAtual = velocidadeAtual;
    }
  }

  bool estaNoLimite() {
    if (this._velocidadeAtual == this.velocidadeMaxima) {
      return true;
    } else {
      return false;
    }
  }

  int acelerar() {
    if (estaNoLimite()) {
      return this._velocidadeAtual;
    } else {
      this._velocidadeAtual += 5;
      return this._velocidadeAtual;
    }
  }

  int frear() {
    if (this._velocidadeAtual <= 0) {
      return this._velocidadeAtual;
    } else {
      this._velocidadeAtual -= 5;
      return this._velocidadeAtual;
    }
  }

  int freadaBrusca() {
    return this._velocidadeAtual = 0;
  }
}
