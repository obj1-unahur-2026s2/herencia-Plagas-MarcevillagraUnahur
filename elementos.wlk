class Hogar {
  var nivelMugre
  const confort

  method nivelMugre() = nivelMugre

  method confort() = confort

  method esBueno() = nivelMugre <= confort / 2

  method recibirAtaque(plaga) {
    nivelMugre += plaga.nivelDaño()
  }
}

object configuracionHuertas {
  var nivelMinimo = 0

  method nivelMinimo() = nivelMinimo

  method nivelMinimo(nuevoNivel) {
    nivelMinimo = nuevoNivel
  }
}

class Huerta {
  var capacidadProduccion

  method capacidadProduccion() = capacidadProduccion

  method esBueno() = capacidadProduccion > configuracionHuertas.nivelMinimo()

  method recibirAtaque(plaga) {
    capacidadProduccion -= plaga.nivelDaño() * 0.1
    if (plaga.transmiteEnfermedades()) {
      capacidadProduccion -= 10
    }
  }
}

class Mascota {
  var nivelSalud

  method nivelSalud() = nivelSalud

  method esBueno() = nivelSalud > 250

  method recibirAtaque(plaga) {
    if (plaga.transmiteEnfermedades()) {
      nivelSalud = (nivelSalud - plaga.nivelDaño()).max(0)
    }
  }
}

class Barrio {
  const elementos = []

  method elementos() = elementos

  method agregarElemento(elemento) {
    elementos.add(elemento)
  }

  method quitarElemento(elemento) {
    elementos.remove(elemento)
  }

  method cantBuenos() = elementos.count({ e => e.esBueno() })

  method cantNoBuenos() = elementos.count({ e => not e.esBueno() })

  method esCopado() = self.cantBuenos() > self.cantNoBuenos()
}
