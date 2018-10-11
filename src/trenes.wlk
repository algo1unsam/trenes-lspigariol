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
	//.min(self.velMaxPermitida())

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
	
//	method cantidadDeBanos() {
//		return vagones.sum{ vagon => vagon.banos() }
//	}
//
//	method siTodosSonLivianos() {
//		return vagones.all{ vagon => vagon.peso() < 2500 }
//	}
//
//method capacidadPasajeros() {
//		return vagones.sum{ vagon => vagon.cantidadPasajeros() }
//	}
//
//	method velMaxPermitida()
//	method pesoMaxLocomotoras() {
//		return locomotoras.sum{ locomotora => locomotora.peso() }
//	}
//

}

//class FormacionCortaDistancia inherits Formacion{
//	
//	method estaBienArmada(){
//		return not self.compleja()
//		
//	}
//	
//	override method velMaxPermitida(){
//		
//		return 60
//		 
//		
//	}
//}
//
//
//
//class FormacionLargaDistancia inherits Formacion{
//	
//	const origen = null
//	const destino = null
//	
//	method estaBienArmada(){
//		
//	return self.capacidadPasajeros()/50 >= self.cantidadDeBanos()	
//		
//	}
//			
//	override method velMaxPermitida(){
//		if (self.uneDosCiudadesGrandes())
//		return 200
//		else
//		return 150
//	}
//	
//	method uneDosCiudadesGrandes(){
//		return origen.esGrande() and destino.esGrande()
//		 
//	}
//		
//
//}
//class FormacionAltaVelocidad inherits FormacionLargaDistancia {
//
//	override method estaBienArmada() {
//		return super() and self.siTodosSonLivianos() and self.velMax() >= 250
//	}
//
//	override method velMaxPermitida() {
//		return 400
//	}
//
//}
//
//class Ciudad {
//	
//	const property esGrande=true
//
//}