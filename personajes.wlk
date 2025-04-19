//jugadora
object luisa {
  var personajeActivo = floki
  var personajeInactivo = mario

  method cambiarPersonajeActivo() {
    const personajeActivoAntes = personajeActivo
    personajeActivo = personajeInactivo
    personajeInactivo = personajeActivoAntes
  }

  method aparece(unElemento) {
    personajeActivo.encontrar(unElemento)
  }
}

//personaje - guerrero
object floki {
  method encontrar(unElemento) {
  var arma = ballesta
    unElemento.recibirAtaque(arma.potencia())
    if (arma.estaCargada()) {
      arma.usar()
    }
  }
}

//personaje trababajor
object mario {
  var valorRecolectado = 0
  var ultimoElementoEncontrado = null

  method valorRecolectado() { return valorRecolectado}

  method ultimoElementoEcontrado(unElemento) { 
    ultimoElementoEncontrado = unElemento
  }

  method hayUltimoElementoEncontrado() {
    return ultimoElementoEncontrado != null
  }

  method encontrar(unElemento) {
    unElemento.recibirTrabajo()
    self.aumentarValorRecolectado(unElemento)
    self.ultimoElementoEcontrado(unElemento)
  }

  method aumentarValorRecolectado(unElemento) {
    valorRecolectado += unElemento.valorRecolectado()
  }

  method esFeliz() {
    return self.valorRecolectado() >= 50 || 
      (self.hayUltimoElementoEncontrado() && (ultimoElementoEncontrado.altura() >= 10))
  }

}

//arma
object ballesta {
  var flechas = 10

  method flechas(){
    return {flechas}
  }

  method usar(){
    flechas = self.flechas() - 1
  }

  method estaCargada() {
    return self.flechas() != 0
  }

  method potencia() {
    return 4
  }
}

//arma
object jabalina {
  var estaCargada = true

  method estaCargada() { return estaCargada}

  method usar() {estaCargada = false}

  method potencia() {
    return 30
  }
}

//elemento
object castillo {
  var nivelDefensa = 150

  method altura() {
    return 20
  }

  method nivelDeDefensa() {
    return nivelDefensa
  }

  method recibirAtaque(danio) {
    nivelDefensa -= danio
  }

  method recibirTrabajo() {
    nivelDefensa = [nivelDefensa + 20, 200].min()
  }

  method valorOtorgado() {
    return 0.2 * self.nivelDeDefensa()
  }

}

//elemento
object aurora {
  var estaViva = true

  var valor = 0

  method altura() {
    return 1
  }

  method estaViva() {
    return estaViva
  }

  method recibirAtaque(danio) {
    if (danio > 10) {
      estaViva = false
    }
  }

  method recibirTrabajo() {}

  method valorOtorgado() {
    return 15
  }
}

//elemento
object tipa {
  var altura = 8

  var valor = 0

  method altura() { return altura}

  method recibirAtaque() {}

  method recibirTrabajo() {
    altura = self.altura() + 1
  }

  method valorOtorgado() {
    valor = 2 * self.altura()
  }
}