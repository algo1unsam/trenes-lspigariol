import deposito.*

class Formacion {

	var vagones = []
	var property locomotoras = []

	method agregarVagon(vagon) {
		vagones.add(vagon)
	}

	method sacarVagon(vagon) {
		vagones.remove(vagon)
	}

	method agregarLocomotora(locomotora) {
		locomotoras.add(locomotora)
	}

	method sacarLocomotora(locomotora) {
		locomotoras.remove(locomotora)
	}
	// Punto 1 
	method cuantosLivianos() {
		return vagones.count{ vagon => vagon.peso() < 2500 }
	}

	// Punto 2
	method velocidadMaxima() {
		return locomotoras.min{ locomotora => locomotora.velocidad() }.velocidad()
	}

	// Punto 3
	method eficiente() {
		return locomotoras.all{ locomotora => locomotora.buenArrastre()}
	}

	// Punto 4
	method puedeMoverse() {
		return self.arrastreUtilTotal() > self.pesoTotalVagones()
	}

	method arrastreUtilTotal() {
		return locomotoras.sum{ locomotora => locomotora.arrastreUtil() }
	}

	method pesoTotalVagones() {
		return vagones.sum{ vagon => vagon.peso() }
	}
	// Punto 5
	method arrastreFaltante() {
		return (self.pesoTotalVagones() - self.arrastreUtilTotal()).max(0)
	}
	
	// Para el Punto 6
	method vagonMasPesado() {
		return vagones.max{ vagon => vagon.peso()}
	}
	 
	//Para el Punto 7
	method compleja() {
		return self.cantidadUnidades() > 20 or self.pesoTotal() > 10000
	}
	method cantidadUnidades() {
		return self.unidades().size() 
	}
	method pesoTotal(){
		return self.unidades().sum{u=>u.peso()} 
	}
	method unidades() = locomotoras + vagones 
	
	// Para el Punto 8
	method completaArrastre(locomotora){
		return locomotora.arrastreUtil() >= self.arrastreFaltante() 
	}
	
	// Segunda parte

	// Punto 9
	method bienArmada(){
		return self.puedeMoverse() and self.bienArmadaEspecifica()
	}
	
	method bienArmadaEspecifica()
	
	// Punto 10
	method velocidadMaximaReal() = self.velocidadMaxima().min(self.limiteVelocidad())
	
	method limiteVelocidad() = self.velocidadMaxima()
	

}



class FormacionCortaDistancia inherits Formacion{
	
	// Para Punto 9
	override method bienArmadaEspecifica() = !self.compleja()
		
	// Para Punto 10
	override method limiteVelocidad() = 60
		
}



class FormacionLargaDistancia inherits Formacion{
	
	var property origen 
	var property destino 
	
	// Para Punto 9
	override method bienArmadaEspecifica() = self.cantidadPasajeros()/50 >= self.cantidadBanos()	
		
	method cantidadBanos(){
		return vagones.sum({vagon => vagon.cantidadBanos()})
	}
			
	method cantidadPasajeros() {
		return vagones.sum{ vagon => vagon.pasajeros() }
	}

	//Para Punto 10
	override method limiteVelocidad() =
		if (self.uneDosCiudadesGrandes()) 200 else 150
	
	method uneDosCiudadesGrandes() = 
		origen.esGrande() and destino.esGrande()

}

// Para Punto 10
class Ciudad {
	
	var property esGrande=true

}


// Punto 11
class FormacionAltaVelocidad inherits FormacionLargaDistancia {

	override method bienArmada() {
		return super() and self.vagonesLivianos() and self.velocidadMaximaReal() >= 250
	}

	override method limiteVelocidad() = 400
	
	method vagonesLivianos() {
		return vagones.all{ vagon => vagon.peso() < 2500 }
	}

}

