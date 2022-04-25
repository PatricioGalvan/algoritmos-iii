!classDefinition: #ElHabitatDeLasAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitatDeLasAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitatDeLasAvispas class' category: 'AvispasYAbejasParte2'!
ElHabitatDeLasAvispas class
	instanceVariableNames: 'cantidadDeRecursosEnElHabitat cantidadDeHuevosDeAvispasEnElHabitat'!

!ElHabitatDeLasAvispas class methodsFor: 'cantidad de huevos/insectos' stamp: 'PG 4/25/2022 09:51:56'!
cantidadDe: unRecurso
	"Devuelve la cantidad de orugas o de polillas en el hábitat"
	
	^(cantidadDeRecursosEnElHabitat at: unRecurso ifAbsent:[0]).
! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidad de huevos/insectos' stamp: 'PG 4/25/2022 09:52:26'!
cantidadDeHuevosDe: unaAvispa
	"Devuelve la cantidad de huevos con una firma genética"

	^(cantidadDeHuevosDeAvispasEnElHabitat at: unaAvispa ifAbsent:[0]).

! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidad de huevos/insectos' stamp: 'PG 4/25/2022 09:52:50'!
cantidadDeHuevosDeAvispas
	"Devuelve la cantidad total de huevos de avispas en el hábitat"

	| totalDeHuevos |
	
	totalDeHuevos := cantidadDeHuevosDeAvispasEnElHabitat values.
	^totalDeHuevos sum: [ : unNumero | unNumero ] ifEmpty: [ 0 ].
! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidad de huevos/insectos' stamp: 'PG 4/25/2022 09:53:07'!
cantidadDeOrugas
	"Devuelve la cantidad total de orugas del hábitat"

	^self cantidadDe: #Orugas.
! !

!ElHabitatDeLasAvispas class methodsFor: 'cantidad de huevos/insectos' stamp: 'PG 4/25/2022 09:53:24'!
cantidadDePolillas
	"Devuelve la cantidad total de polillas del hábitat"

	^self cantidadDe: #Polillas.
! !


!ElHabitatDeLasAvispas class methodsFor: 'incrementar huevos/insectos' stamp: 'PG 4/25/2022 09:53:50'!
incrementarEnUnoLaCantidadDe: unRecurso
	"Aumenta en 1 la cantidad de orugas o de polillas en el hábitat"

	| cantidadDelRecurso |

	cantidadDelRecurso := self cantidadDe: unRecurso.
	cantidadDeRecursosEnElHabitat at: unRecurso put: cantidadDelRecurso + 1 .
! !

!ElHabitatDeLasAvispas class methodsFor: 'incrementar huevos/insectos' stamp: 'PG 4/25/2022 09:54:12'!
incrementarEnUnoLaCantidadDeHuevosDe: unaAvispa
	"Aumenta en 1 la cantidad de huevos con un tipo de firma genética"

	| cantidadDeHuevos |

	cantidadDeHuevos := self cantidadDeHuevosDe: unaAvispa.
	cantidadDeHuevosDeAvispasEnElHabitat at: unaAvispa put: cantidadDeHuevos + 1.
! !


!ElHabitatDeLasAvispas class methodsFor: 'reducir huevos/insectos' stamp: 'PG 4/25/2022 09:54:37'!
reducirEnUnoLaCantidadDe: unRecurso	
	"Reduce en 1 la cantidad de orugas o de polillas en el hábitat"

	| cantidadDelRecurso |

	cantidadDelRecurso := self cantidadDe: unRecurso.
	cantidadDeRecursosEnElHabitat at: unRecurso put: cantidadDelRecurso - 1 .
	
	! !

!ElHabitatDeLasAvispas class methodsFor: 'reducir huevos/insectos' stamp: 'PG 4/25/2022 09:54:56'!
reducirEnUnoLaCantidadDeHuevosDe: unaAvispa	
	"Reduce en 1 la cantidad de huevos con un tipo de firma genética"

	| cantidadDeHuevos |
	
	cantidadDeHuevos := self cantidadDeHuevosDe: unaAvispa.
	cantidadDeHuevosDeAvispasEnElHabitat at: unaAvispa put: cantidadDeHuevos - 1.
! !


!ElHabitatDeLasAvispas class methodsFor: 'reiniciar habitat' stamp: 'PG 4/25/2022 09:55:34'!
reiniciarElHabitat	
	"Elimina todas las cantidades de huevos y recursos en el hábitat"

	cantidadDeRecursosEnElHabitat := Dictionary new.	
	cantidadDeHuevosDeAvispasEnElHabitat := Dictionary new .
! !


!ElHabitatDeLasAvispas class methodsFor: '--** private fileout/in **--' stamp: 'PG 4/25/2022 10:17:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeRecursosEnElHabitat := ((Dictionary new)).
	cantidadDeHuevosDeAvispasEnElHabitat := ((Dictionary new)).! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: ''!

!LaAvispaLara class methodsFor: 'reproduccion de avispas' stamp: 'PG 4/25/2022 10:03:20'!
intentarReproducirse	
	"La avispa intenta reproducirse alimentandose con un huevo de otra avispa"
	| huevoAConsumir |
	
	huevoAConsumir := self verSiHayUnHuevoParaAlimentarse.
	
	(huevoAConsumir isNotEqualTo: nil) ifTrue: [
		self reproducirALaraAlimentandoseDeHuevosDe: huevoAConsumir.			
	].
! !

!LaAvispaLara class methodsFor: 'reproduccion de avispas' stamp: 'PG 4/25/2022 10:03:42'!
reproducirALaraAlimentandoseDeHuevosDe: unaAvispa
	"Revisa que haya suficiente cantidad del recurso que usa para reproducirse. Si lo hay, reduce el recurso consumido y deja un huevo"

	ElHabitatDeLasAvispas reducirEnUnoLaCantidadDeHuevosDe: unaAvispa.
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDeHuevosDe: #FirmaGeneticaDeLara.	! !

!LaAvispaLara class methodsFor: 'reproduccion de avispas' stamp: 'PG 4/25/2022 10:11:17'!
verSiHayUnHuevoParaAlimentarse
	"Devuelve un huevo a consumir por la avispa en caso de que haya aunque sea 1 disponible. Si no lo hay, devuelve nil"
	
	| huevosDePolly huevosDeOrianaYOrnella |
	
	huevosDePolly := ElHabitatDeLasAvispas cantidadDeHuevosDe: #FirmaGeneticaDePolly.
	huevosDeOrianaYOrnella := ElHabitatDeLasAvispas cantidadDeHuevosDe: #FirmaGeneticaDeOrianaYOrnella.
	
	(huevosDeOrianaYOrnella isNotEqualTo: 0) ifTrue: [				
		^#FirmaGeneticaDeOrianaYOrnella.
	].

	(huevosDePolly isNotEqualTo: 0) ifTrue: [				
		^#FirmaGeneticaDePolly.
	]
	ifFalse: [
		^nil.
	].
! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: ''!

!LaAvispaOriana class methodsFor: 'reproduccion de avispas' stamp: 'PG 4/25/2022 09:59:43'!
intentarReproducirse
	"La avispa intenta reproducirse alimentandose con una oruga"
	
	self intentarReproducirseCon: #Orugas paraObtenerHuevosDe: #FirmaGeneticaDeOrianaYOrnella.
! !

!LaAvispaOriana class methodsFor: 'reproduccion de avispas' stamp: 'PG 4/25/2022 09:58:22'!
intentarReproducirseCon: unRecurso paraObtenerHuevosDe: unaAvispa
	"Revisa que haya suficiente cantidad del recurso que usa para reproducirse. Si lo hay, reduce el recurso consumido y deja un huevo"
	
	| recursoAConsumir |
	
	recursoAConsumir := ElHabitatDeLasAvispas cantidadDe: unRecurso.
		
	(recursoAConsumir isEqualTo: 0) ifFalse: [		
		ElHabitatDeLasAvispas reducirEnUnoLaCantidadDe: unRecurso.			
		ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDeHuevosDe: unaAvispa.		
	].
! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
LaAvispaOriana subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
LaAvispaOriana subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: ''!

!LaAvispaPolly class methodsFor: 'reproduccion de avispas' stamp: 'PG 4/25/2022 09:59:38'!
intentarReproducirse	
	"La avispa intenta reproducirse alimentandose con una polilla"

	self intentarReproducirseCon: #Polillas paraObtenerHuevosDe: #FirmaGeneticaDePolly.
! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: 'reiniciarCantidadDeHuevos'!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'PG 4/23/2022 14:42:24'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'PG 4/23/2022 14:42:28'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'PG 4/23/2022 14:42:31'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 21:42:01'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ElHabitatDeLasAvispas cantidadDeHuevosDe: #FirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 21:42:08'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ElHabitatDeLasAvispas cantidadDeHuevosDe: #FirmaGeneticaDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 21:42:14'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ElHabitatDeLasAvispas cantidadDeHuevosDe: #FirmaGeneticaDeOrianaYOrnella.

! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 21:42:21'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ElHabitatDeLasAvispas cantidadDeHuevosDe: #FirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/23/2022 14:29:42'!
habitat
	^ElHabitatDeLasAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 20:53:48'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas .
	self queElHabitatTengaDosPolillasMas .
! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/23/2022 15:40:54'!
laAvispaLara
	^LaAvispaLara ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/23/2022 14:58:48'!
laAvispaOriana
	^LaAvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/23/2022 14:57:42'!
laAvispaOrnella
	^LaAvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 21:50:48'!
laAvispaPolly
	^LaAvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 17:59:41'!
queElHabitatTengaDosOrugasMas
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDe: #Orugas .
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDe: #Orugas .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 18:08:15'!
queElHabitatTengaDosPolillasMas
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDe: #Polillas .
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDe: #Polillas .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 17:59:32'!
queElHabitatTengaUnaOrugaMas
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDe: #Orugas .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 18:08:11'!
queElHabitatTengaUnaPolillaMas
	ElHabitatDeLasAvispas incrementarEnUnoLaCantidadDe: #Polillas .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'PG 4/24/2022 17:14:18'!
retrocederElHabitatAlInicioDeLosTiempos	
	ElHabitatDeLasAvispas reiniciarElHabitat .	! !


!PruebasReproduccionDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'PG 4/25/2022 10:17:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	reiniciarCantidadDeHuevos := nil.! !

ElHabitatDeLasAvispas initializeAfterFileIn!
PruebasReproduccionDeAvispas initializeAfterFileIn!