!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'PG 5/8/2022 18:08:59'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'PG 5/9/2022 12:39:50'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne
! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'PG 5/7/2022 16:28:39'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'PG 5/9/2022 12:40:57'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'PG 5/8/2022 18:04:09'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'PG 5/7/2022 17:04:00'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:54:22'!
* aMultiplicand 

	^aMultiplicand beMultipliedToAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 18:47:19'!
+ anAdder 	

	^anAdder beAddedToAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:55:00'!
- aSubtrahend 

	^aSubtrahend beSubstractedFromAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:55:10'!
/ aDivisor 	

	^aDivisor divideAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 18:53:37'!
fibonacci

	self subclassResponsibility .
! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'PG 5/9/2022 12:59:25'!
isOne
	
	^false! !

!Entero methodsFor: 'testing' stamp: 'PG 5/9/2022 13:01:20'!
isZero
	
	^false! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:23:49'!
beAddedToAFraccion: anAugend
	"Returns result of adding an Entero to a Fraccion"

	| newNumerator newDenominator |
	
	newNumerator := anAugend numerator + (self * anAugend denominator).
	newDenominator := anAugend denominator.
	
	^newNumerator / newDenominator.
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:23:46'!
beAddedToAnEntero: anAugend 
	"Returns result of adding an Entero to another Entero"

	^Entero with: anAugend integerValue + self integerValue.
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:24:16'!
beMultipliedToAFraccion: aMultiplier
	"Returns result of multiplying an Entero to a Fraccion"

	^(self * aMultiplier numerator) / aMultiplier denominator .
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:23:37'!
beMultipliedToAnEntero: aMultiplier
	"Returns result of multiplying an Entero to another Entero"

	^Entero with: aMultiplier integerValue * self integerValue.
	
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:23:34'!
beSubstractedFromAFraccion: aMinuend
	"Returns result of substracting an Entero from a Fraccion"

	| newNumerator newDenominator|
	
	newNumerator := aMinuend numerator - (aMinuend denominator * self).
	newDenominator := aMinuend denominator.
	
	^ newNumerator / newDenominator.
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:23:30'!
beSubstractedFromAnEntero: aMinuend
	"Returns result of substracting an Entero from another Entero"
	
	^Entero with: aMinuend integerValue - self integerValue.
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:35:59'!
divideAFraccion: aDividend
	"Returns result of dividing a Fraccion by an Entero"

	^(aDividend numerator) / (aDividend denominator * self).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:36:03'!
divideAnEntero: aDividend
	"Returns result of dividing an Entero by an Entero"

	^Fraccion with: aDividend over: self.
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PG 5/8/2022 17:41:21'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'PG 5/8/2022 20:06:16'!
with: aValue 	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	
	| enteroSubclass |
	
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].	
			
	enteroSubclass := (Entero subclasses) detect: [:subclass | subclass includes: aValue].

	^enteroSubclass new initializeWith: aValue.
! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 13:28:48'!
* aMultiplicand
	"Returns 0 when trying to multiply a multiplicand to 0"

	^0.
! !

!Cero methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 13:28:30'!
+ anAdder
	"Returns the adder when trying to add to 0"

	^anAdder.
! !

!Cero methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 13:25:33'!
divideAFraccion: aDividend
	"Returns result of dividing a Fraccion by 0"

	self error: self class canNotDivideByZeroErrorDescription
! !

!Cero methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 13:25:45'!
divideAnEntero: aDividend
	"Returns result of dividing an Entero by 0"
	
	self error: self class canNotDivideByZeroErrorDescription
! !

!Cero methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 16:39:33'!
fibonacci

	^ Entero with: 1.
	
	! !

!Cero methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 13:29:24'!
isZero	
	
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 18:34:13'!
includes: aValue

	^aValue = 0! !


!classDefinition: #MayorAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #MayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!MayorAUno methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 17:23:07'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^(self - one) fibonacci + (self - two) fibonacci.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayorAUno class' category: 'Numeros-Parte2-Ejercicio'!
MayorAUno class
	instanceVariableNames: ''!

!MayorAUno class methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 18:34:10'!
includes: aValue

	^aValue > 1! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 14:43:59'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 18:35:18'!
includes: aValue
	^aValue < 0.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 13:28:10'!
* aMultiplicand
	"Returns the multiplicand when trying to multiply to the neutral number"

	^aMultiplicand.
! !

!Uno methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 15:17:31'!
fibonacci

	^Entero with: 1.
	! !

!Uno methodsFor: 'as yet unclassified' stamp: 'PG 5/9/2022 12:59:35'!
isOne

	^true
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'PG 5/8/2022 18:34:15'!
includes: aValue

	^aValue = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:55:30'!
* aMultiplier 

	^aMultiplier beMultipliedToAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:55:38'!
+ anAdder 

	^anAdder beAddedToAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:55:45'!
- aSubtrahend 

	^aSubtrahend beSubstractedFromAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PG 5/8/2022 11:55:50'!
/ aDivisor 

	^aDivisor divideAFraccion: self.
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:31:53'!
beAddedToAFraccion: anAugend
	"Returns result of adding a Fraccion to another Fraccion"

	| newNumerator newDenominator |
	
	newNumerator := (anAugend numerator * self denominator) + (anAugend denominator * self numerator).
	newDenominator := anAugend denominator * self denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:38:05'!
beAddedToAnEntero: anAugend 
	"Returns result of adding a Fraccion to an Entero"

	^(self denominator * anAugend) + self numerator / self denominator 	.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:32:24'!
beMultipliedToAFraccion: aMultiplier
	"Returns result of multiplying a Fraccion to another Fraccion"

	| newNumerator newDenominator |
	
	newNumerator := self numerator * aMultiplier numerator.
	newDenominator := self denominator * aMultiplier denominator.
	
	^newNumerator / newDenominator .
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:37:22'!
beMultipliedToAnEntero: aMultiplier
	"Returns result of multiplying an Fraccion to an Entero"

	^self numerator * aMultiplier / self denominator .
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:37:37'!
beSubstractedFromAFraccion: aMinuend
	"Returns result of substracting a Fraccion from a Fraccion"

	| newNumerator newDenominator |
	
	newNumerator := (aMinuend numerator * self denominator) - (aMinuend denominator * self numerator).
	newDenominator := aMinuend denominator * self denominator.
	
	^ newNumerator / newDenominator.
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:33:35'!
beSubstractedFromAnEntero: aMinuend
	"Returns result of substracting a Fraccion from an Entero"

	| newNumerator newDenominator|
	
	newNumerator := (aMinuend * self denominator) - self numerator.
	newDenominator := self denominator.
	
	^ newNumerator / newDenominator.
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:36:09'!
divideAFraccion: aDividend
	"Returns result of dividing a Fraccion by a Fraccion"

	^(aDividend numerator * self denominator) / (aDividend denominator * self numerator).
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'PG 5/9/2022 13:36:14'!
divideAnEntero: aDividend
	"Returns result of dividing an Entero by a Fraccion"

	^(aDividend * self denominator) / (self numerator).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'PG 5/9/2022 12:55:52'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
