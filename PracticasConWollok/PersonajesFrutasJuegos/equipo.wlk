import personajes.*
import frutas.*
import juegos.*

object equipo {
	var property jugadorDerecho
	var property jugadorIzquierdo
	var property directorTecnico
	
	method asignarPersona(persona1, persona2, persona3) {
		jugadorDerecho = persona1
		jugadorIzquierdo = persona2
		directorTecnico = persona3
	}
	
	method rotarPosiciones() {
		jugadorDerecho = jugadorIzquierdo
		jugadorIzquierdo = jugadorDerecho
	}
	
	method cambiarDirectorTecnico(candidatoDirectorTecnico) {
		if(candidatoDirectorTecnico.energia() > directorTecnico.energia()) {
			directorTecnico = candidatoDirectorTecnico
		}
		else {
			
		}
	}
	
	method promedioDeEnergiaDelEquipo() {
		return jugadorDerecho.energia() + jugadorIzquierdo.energia() + directorTecnico.energia()
	}
	
	method elEquipoEstaFeliz() {
		return jugadorDerecho.estaFeliz() and jugadorIzquierdo.estaFeliz() and directorTecnico.estaFeliz()
	}
}