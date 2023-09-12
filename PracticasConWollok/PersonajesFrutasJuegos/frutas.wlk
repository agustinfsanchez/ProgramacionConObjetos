import personajes.*
import equipo.*
import juegos.*

object manzana {
	var color = "verde"

	method energiaQueProporciona() {
		if(color == "verde") {
			return 7
		}
		else if(color == "rojo") {
			return 14
		}
		else {
			return 5
		}
	}
	
	method madurar() {
		color = "rojo"
	}
}

object mandarina {
	var property gramos = 60
	var property color = "naranja"
	
	method energiaQueProporciona() {
		return 2 
	}
	
	method seReseca() {
		gramos = gramos - 10
	}
}

object banana {
	
	method energiaQueProporciona() {
		return 5
	}
}