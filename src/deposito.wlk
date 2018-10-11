import trenes.*

class Deposito {

	var formaciones = []
	var property locomotorasSueltas = []

	method agregarFormacion(formacion) {
		formaciones.add(formacion)
	}
	method agregarLocomotora(locomotora) {
		locomotorasSueltas.add(locomotora)
	}
	method quitarLocomotora(locomotora) {
		locomotorasSueltas.remove(locomotora)
	}

	// Punto 6
	method vagonesMasPesados() {
		return formaciones.map{ formacion => formacion.vagonMasPesado()}
	}
	// Punto 7
	method necesitaConductorExperimentado() {
		return formaciones.any{ formacion => formacion.compleja() }
	}

	// Punto 8
	method permitirMoverse(formacion) {
		var locomotora
		if (!formacion.puedeMoverse() && self.hayLocomotoraDisponible(formacion)){ 
			locomotora = self.buscarLocomotoraDisponible(formacion)
			formacion.agregarLocomotora(locomotora)
			self.quitarLocomotora(locomotora)
		}
	}
	method hayLocomotoraDisponible(formacion){
		return locomotorasSueltas.any{loco => formacion.completaArrastre(loco)}
	}
	method buscarLocomotoraDisponible(formacion){
		return locomotorasSueltas.find{loco => formacion.completaArrastre(loco)}
	}
	

}

class Locomotora {

	const property peso = 1000
	const arrastreMax = 12000
	const property velocidad = 80

	method arrastreUtil() = arrastreMax - peso
	
	method buenArrastre() = self.arrastreUtil() >= peso * 5 
}

class VagonPasajeros {
	var property cantidadBanos = 2
	var property largo 
	var property ancho 
	
	method pasajeros() = largo * if (ancho<=2.5) 8 else 10 
	
	method peso() = self.pasajeros() * 80
}


class VagonCarga{
	const property cantidadBanos = 0
	var property carga
	
	method pasajeros()= 0
	
	method peso() = carga + 160
	
}
