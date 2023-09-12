import especies.*

object reserva {
	const property habitats = []
	
	method agregarHabitat(unHabitat){habitats.add(unHabitat)}
	method eliminarHabitat(unHabitat){habitats.remove(unHabitat)}
	method habitatMayorBiomasa(){return habitats.max({h=>h.biomasaTotal()})}
	method cantTotalBiomasa(){return habitats.sum({h=>h.biomasaTotal()})}
	method habitatsSinEquilibrio(){return habitats.filter({h=>h.estaEnEquilibrio()})}
	method estaEnTodosLosHabitats(unaEspecie){return habitats.all({h=>h.seresVivos().contains(unaEspecie)})}
}

class Habitat {
	const flora = []
	const fauna = []
	const property especiesDelHabitat  = [flora, fauna]	
	
	method agregarEspecieDeFauna(unaEspecie){
		fauna.add(unaEspecie)
	}
	method agregarEspecieDeFlora(unaEspecie){
		flora.add(unaEspecie)
	}
	
	method seresVivos() = (flora.map{e => e.plantas()} + fauna.map{e => e.animales()}).flatten()
	
	method biomasaTotal() = flora.sum{e=>e.biomasaTotal()} + fauna.sum{e=>e.biomasaTotal()}
		
	method estaEnEquilibrio() { 
		return  especiesDelHabitat.sum{e => e.map{p => p.cantidadDeEjemplaresGrandes()}.flatten()} < 
				especiesDelHabitat.sum{e => e.map{p => p.cantidadDeEjemplaresPequenios()}.flatten()}.div(3) && 
				self.seresVivos().any{e => e.esMediano()}
	}
	
	method producirIncendio(){
		flora.forEach{e => e.plantas().forEach{p => p.estarEnIncendio()}}
		fauna.forEach{e => e.plantas().forEach{a => a.estarEnIncendio()}}
		self.removerTodosLosMuertos()
	}
	
	method removerTodosLosMuertos(){
		self.removerFloraMuerta(self.floraMuerta())
		self.removerFaunaMuerta(self.faunaMuerta())
	}
	
	method removerFloraMuerta(lista){
		flora.forEach({e => e.plantas().removeAll(lista)})
	}
	
	method removerFaunaMuerta(lista){
		fauna.forEach({e => e.animales().removeAll(lista)})
	}
	
	
	method floraMuerta()= flora.map({s=>s.plantas().filter{p => p.estaVivo()}}).flatten()
	method faunaMuerta()= fauna.map({s=>s.plantas().filter{a => a.estaVivo()}}).flatten()
}
