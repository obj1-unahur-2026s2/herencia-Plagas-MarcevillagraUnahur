class Plaga {
  var poblacion

  method poblacion() = poblacion

  method transmiteEnfermedades() = poblacion >= 10

  method nivelDaño()

  method efectoAtaque() {
    poblacion = poblacion * 1.1
  }

  method atacar(elemento) {
    self.efectoAtaque()
    elemento.recibirAtaque(self)
  }
}

class Cucarachas inherits Plaga {
  var pesoPromedio

  method pesoPromedio() = pesoPromedio

  override method nivelDaño() = poblacion / 2

  override method transmiteEnfermedades() = super() and (pesoPromedio >= 10)

  override method efectoAtaque() {
    super()
    pesoPromedio += 2
  }
}

class Pulgas inherits Plaga {
  override method nivelDaño() = poblacion * 2
}

class Garrapatas inherits Pulgas {
  override method efectoAtaque() {
    poblacion = poblacion * 1.2
  }
}

class Mosquitos inherits Plaga {
  override method nivelDaño() = poblacion

  override method transmiteEnfermedades() = super() and (poblacion % 3 == 0)
}
