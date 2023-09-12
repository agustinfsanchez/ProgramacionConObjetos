import Parcela.*
import semilla.*

object inta {
	const property parcelas = []
	
	method agregarParcela(unaParcela){
		parcelas.add(unaParcela)
	}
	method quitarParcela(unaParcela){
		parcelas.remove(unaParcela)
	}
	
	method promedioDePlantas() = parcelas.sum{p => p.plantas().size()} / parcelas.size()
	
	method parcelaMasAutosustentable() = self.parcelasConMasDeCuatroPlantas().max{p => self.porcentajeDePlantasAsociadasA(p)}
	
	method parcelasConMasDeCuatroPlantas() =  parcelas.filter{p => p.plantas().size() > 4}
	
	method porcentajeDePlantasAsociadasA(parcela){
		return  parcela.plantas().count{pla => parcela.seAsociaBienCon(pla)} / parcela.plantas().size()
	}
}
