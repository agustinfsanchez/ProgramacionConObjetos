import personajes.*
import frutas.*
import equipo.*

object voley {
	var property minutosPracticados = 0
	
	method energiaQueDisminuye() {
		return 2 * minutosPracticados
	}
}

object futbol {
	
	method energiaQueDisminuye() {
		return 10
	}
}

object aerobic {
	var property temperaturaActualEnLaCiudad = 20

	method energiaQueAumenta() {
		return temperaturaActualEnLaCiudad / 2
	}
}

object basquet {
	var property juegaLebron = true
	
	method energiaQueDisminuye() {
		if(not juegaLebron) {
			return 10
		}
		else {
			return 5
		}
	}
}