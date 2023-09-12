class EspecieFauna {
	const property pesoReferencia
	const property animales = []

	method agregarAnimal(unAnimal){
		animales.add(unAnimal)
	}
	
	method quitarAnimal(unAnimal){
		animales.remove(unAnimal)
	}
	
	method biomasaTotal() = animales.sum{a => a.biomasa()}
	
	method cantidadDeEjemplaresPequenios()= animales.count({a=>a.esPequenio()})
	
	method cantidadDeEjemplaresGrandes()= animales.count({a=>a.esGrande()})
	
	method hayAlgunMediano()= animales.any({p=>p.esMediano()})
}

class EspecieFlora {
	const property alturaReferencia
	const property plantas = []
	
	method agregarPlanta(unaPlanta){
		plantas.add(unaPlanta)
	}
	
	method quitarAnimal(unaPlanta){
		plantas.remove(unaPlanta)
	}
	
	method biomasaTotal() = plantas.sum{a => a.biomasa()}
	
	method cantidadDeEjemplaresPequenios()= plantas.count({p=>p.esPequenio()})
	
	method cantidadDeEjemplaresGrandes()= plantas.count({p=>p.esGrande()})
	
	method hayAlgunMediano()= plantas.any({p=>p.esMediano()})
}

class Animal {
	var property peso
	var property pesoReferencia = 0
	const property locomocion
	const estaVivo = locomocion.seSalva(self)
	
	method estaVivo() = estaVivo
	method biomasa() = (peso**2)/pesoReferencia
	method esPequenio() = peso < pesoReferencia/2
	method esMediano() = !self.esPequenio() && !self.esGrande()
	method esGrande() = peso > pesoReferencia*2 
	
	method estarEnIncendio(){
		if (estaVivo){
			peso *=0.9
		}
	}

}

class Planta {
	var property altura
	var property alturaLimite = 10
	var property alturaReferencia
	const estaVivo = !self.esPequenio()

		
	method estaVivo() = estaVivo
	method biomasa() = alturaReferencia.min(altura*2)
	method esPequenio() = altura < alturaLimite
	method esMediano() = altura == alturaLimite
	method esGrande() = altura > alturaLimite

	method estarEnIncendio(){
		if (estaVivo){
			altura -=5
		}
	}
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr {method seSalva(animal) = animal.esMediano()}
object quedarseQuieto {method seSalva(_) = false}