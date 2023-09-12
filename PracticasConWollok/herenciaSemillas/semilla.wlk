import Parcela.*

class Planta {
	const property anioDeObtencion
	const property altura
	
	method horasDeSolQueTolera()
	
	method esFuerte() = self.horasDeSolQueTolera() > 10 
	
	method daNuevasSemillas() = self.esFuerte() || self.condicionParticular()
	
	method condicionParticular()
	
	method espacioQueOcupa()
	
	method esParcelaIdeal(parcela)
	
}

class Menta inherits Planta{
	override method horasDeSolQueTolera() = 6
	
	override method condicionParticular() = altura > 0.4
	
	override method espacioQueOcupa() = altura*3
	
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta{
	override method horasDeSolQueTolera(){
		if(altura < 0.5){
			return 6
		}
		else if(altura.between(0.5, 1)){
			return 7
		}
		else{
			return 9
		}
	}
	
	override method condicionParticular() = anioDeObtencion > 2007 && altura > 1
	
	override method espacioQueOcupa() = altura/2
	
	override method esParcelaIdeal(parcela) = parcela.horasDeSol() == self.horasDeSolQueTolera()
}

class Quinoa inherits Planta{
	const property horasDeSolQueTolera
	
	override method condicionParticular() = anioDeObtencion < 2005
	
	override method espacioQueOcupa() = 0.5
	
	override method esParcelaIdeal(parcela) = parcela.plantas().all{p => p.altura() <= 1.5}
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(parcela) = parcela.plantas().size() == 1
}

class Hierbabuena inherits Menta{
	override method espacioQueOcupa() = super()*2
}

