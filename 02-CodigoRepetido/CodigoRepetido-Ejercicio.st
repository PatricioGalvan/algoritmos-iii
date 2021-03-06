!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/2/2022 13:57:40'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook customerBookModification |
	
	customerBook := CustomerBook new.
	customerBookModification := [customerBook addCustomerNamed: 'John Lennon'].
	
	self assertIf: customerBookModification takesLessTimeThan: 50.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/2/2022 13:58:53'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney customerBookModification |
		
	paulMcCartney := 'Paul McCartney'.	
	customerBook := self initializeCustomerBookWithActiveCustomerNamed: paulMcCartney.	
	
	customerBookModification := [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assertIf: customerBookModification takesLessTimeThan: 100.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/1/2022 22:13:52'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook customerBookModification error assertionsForCustomerBook |

	customerBook := CustomerBook new.
	
	customerBookModification := [customerBook addCustomerNamed: ''].			
	
	error := Error.
			
	assertionsForCustomerBook := [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty ].	
	
	self verifyIf: customerBookModification triggers: error andVerifies: assertionsForCustomerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/1/2022 22:14:04'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon customerBookModification error assertionsForCustomerBook |
				
	johnLennon := 'John Lennon'.	
	customerBook := self initializeCustomerBookWithActiveCustomerNamed: johnLennon.
		
	customerBookModification := [customerBook removeCustomerNamed: 'Paul McCartney'].			
	
	error := NotFound.
	
	assertionsForCustomerBook := [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
	self verifyIf: customerBookModification triggers: error andVerifies: assertionsForCustomerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/2/2022 14:11:36'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney assertionForCustomerIncludedInBook |

	paulMcCartney := 'Paul McCartney'.	
	customerBook := self initializeCustomerBookWithSuspendedCustomerNamed: paulMcCartney.	
	
	assertionForCustomerIncludedInBook := [self assert: (customerBook includesCustomerNamed: paulMcCartney)].
	
	self assertIf: customerBook has: 0 amountOfActiveCustomersAnd: 1 amountOfSuspendedCustomersAnd: 1 totalCustomersAndCheckConditionFor: assertionForCustomerIncludedInBook.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/2/2022 14:12:14'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney assertionForCustomerIncludedInBook |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self initializeCustomerBookWithSuspendedCustomerNamed:paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	assertionForCustomerIncludedInBook := [self deny: (customerBook includesCustomerNamed: paulMcCartney)].
	
	self assertIf: customerBook has: 0 amountOfActiveCustomersAnd: 0 amountOfSuspendedCustomersAnd: 0 totalCustomersAndCheckConditionFor: assertionForCustomerIncludedInBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/1/2022 22:19:00'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon customerBookModification |
				
	johnLennon := 'John Lennon'.	
	customerBook := self initializeCustomerBookWithActiveCustomerNamed: johnLennon.
	
	customerBookModification := [customerBook suspendCustomerNamed: 'Ringo Starr'].
	
	self tryToExecuteAn: customerBookModification onACustomerBookNamed: customerBook forACustomerNamed: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 5/1/2022 22:19:03'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon customerBookModification |
				
	johnLennon := 'John Lennon'.	
	customerBook := self initializeCustomerBookWithSuspendedCustomerNamed: johnLennon.	
	
	customerBookModification := [customerBook suspendCustomerNamed: johnLennon].
	
	self tryToExecuteAn: customerBookModification onACustomerBookNamed: customerBook forACustomerNamed: johnLennon.
! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:12:26'!
assertIf: customerBook has: aNumberOfActiveCustomers amountOfActiveCustomersAnd: aNumberOfSuspendedCustomers amountOfSuspendedCustomersAnd: aNumberOfCustomers
	"Verifies that a given CustomerBook has the supposed amount of active, suspended and total customers"

	self assert: aNumberOfActiveCustomers  equals: customerBook numberOfActiveCustomers.
	self assert: aNumberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: aNumberOfCustomers equals: customerBook numberOfCustomers.

! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:12:30'!
assertIf: customerBook has: aNumberOfActiveCustomers amountOfActiveCustomersAnd: aNumberOfSuspendedCustomers amountOfSuspendedCustomersAnd: aNumberOfCustomers totalCustomersAndCheckConditionFor: assertionForCustomerIncludedInBook
	"Verifies that a given CustomerBook has the supposed amount of active, suspended and total customers. Also executes a given action that should verify if the customerBook includes a customer"

	self assertIf: customerBook has: aNumberOfActiveCustomers amountOfActiveCustomersAnd: aNumberOfSuspendedCustomers amountOfSuspendedCustomersAnd: aNumberOfCustomers.
	assertionForCustomerIncludedInBook value.
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:00:18'!
assertIf: action takesLessTimeThan: milliseconds
	"Asserts if executing an action takes less time than a given time in milliseconds"

	| time |
	
	time := self calculateTimeToExecute: action.
	self assert: (time) < (milliseconds * millisecond).! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 13:59:41'!
calculateTimeToExecute: anAction
	"Calculates how much time it takes to execute an action. Returns that number in milliseconds."

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	anAction value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning).

! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:00:54'!
initializeCustomerBookWithActiveCustomerNamed: aCustomer
	"Creates new CustomerBook with a given customer as an active customer"
	
	| customerBook |
			
	customerBook := CustomerBook new.	
	customerBook addCustomerNamed: aCustomer.
	
	^customerBook.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:01:20'!
initializeCustomerBookWithSuspendedCustomerNamed:aCustomer
	"Creates new CustomerBook with a given customer and suspends them"

	| customerBook|
	
	customerBook := self initializeCustomerBookWithActiveCustomerNamed: aCustomer.	
	customerBook suspendCustomerNamed: aCustomer.
	
	^customerBook.
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:03:24'!
tryToExecuteAn: action onACustomerBookNamed: aCustomerBook forACustomerNamed: aCustomer
	"Tries to execute an action that will trigger the 'CantSuspend' error and then asserts that the CustomerBook still includes a given customer"
	
	| error assertions |
	
	error := CantSuspend.
	
	assertions := [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aCustomer) ].
		
	self verifyIf: action triggers: error andVerifies: assertions.
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'PG 5/2/2022 14:04:40'!
verifyIf: action triggers: error andVerifies: assertions
	"Verifies that executing an action will trigger a given error and then do some assertions"

	[ action value.
	self fail ]
		on: error
		do: assertions.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'PG 5/1/2022 21:40:54'!
findCustomerNamed: aName withType: aType

	1 to: aType size do: 
	[ :index |
		aName = (aType at: index)
			ifTrue: [
				aType removeAt: index.
				^ true
			] 
	].
	^false.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'PG 5/1/2022 21:39:44'!
removeCustomerNamed: aName 
 
	(self findCustomerNamed: aName withType: active) ifTrue: [^aName].
	(self findCustomerNamed: aName withType: suspended) ifTrue: [^aName].

	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
