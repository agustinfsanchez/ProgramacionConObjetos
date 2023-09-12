import frutas.*
import juegos.*
import equipo.*

object martin {
	var property energia = 100
	var property actividadesFisicasDelDia = 0
	var property tieneHambre = false
	var property despensa 
	
	method estaFeliz() {
		return energia > 80 or actividadesFisicasDelDia >= 2 and not tieneHambre
	}
	
	method hacerCompras(unaFruta) {
		despensa = unaFruta
	}
	
	method comer(unaFruta) {
		if(despensa == unaFruta) {
			energia = energia + unaFruta.energiaQueProporciona()
			tieneHambre = false
		}
		else {
			self.tomarVasoDeAgua()
		}
	}
	
	method tomarVasoDeAgua() {
		tieneHambre = false
	}
	
	method dormir() {
		/* 
		if(despensa == manzana) {
			energia = energia + 50
			despensa.madurar()
		}
		else if(despensa == mandarina) {
			energia = energia + 50
			despensa.seReseca()
		}
		else {
			energia = energia + 50
		}  
		*/
	}
}

object maria {
	var property nivelDeEndorfina = 100
	var property energia = nivelDeEndorfina * 2 + amuleto.energiaQueAporta()
	
	method estaFeliz() {
		return nivelDeEndorfina > amuleto.energiaQueAporta()
	}
}

object amuleto {
	var property color = "rojo"
	
	method energiaQueAporta() {
		if(color == "rojo") {
			return 14
		}
		else if(color == "amarillo") {
			return 5
		}
		else {
			return 7
		}
	}
}

object pepe {
	var property energia = 77
	
	method estaFeliz() {
		return true
	}
}

object agustin {
	var property energia = 10
	var property nivelDeDolorDeEspalda = 100
	
	method estaFeliz() {
		return energia > nivelDeDolorDeEspalda
	}
}