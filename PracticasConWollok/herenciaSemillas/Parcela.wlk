import semilla.*

class Parcela {
	var ancho
	var largo
	const property horasDeSol
	const property plantas = []
	
	method superficie() = ancho * largo
	
	method cantidadMaxQueTolera() = if (ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo
	
	method tieneComplicaciones() = plantas.any{p => p.horasDeSolQueTolera() < horasDeSol}
	
	method plantar(planta){
		if(!(plantas.size() > self.cantidadMaxQueTolera() || (horasDeSol - planta.horasDeSolQueTolera()) > 2)){
			plantas.add(planta)		
		}
		else{
			self.error("No es posible plantar")
		}
	} 
	
	method seAsociaBienCon(unaPlanta)
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBienCon(unaPlanta) = !self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBienCon(unaPlanta) = plantas.size() <= 2 && unaPlanta.esFuerte()
}


