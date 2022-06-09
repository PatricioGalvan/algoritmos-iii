!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/8/2022 23:31:16'!
test01PortfolioHasZeroAsBalanceWhenCreated

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 14:25:09'!
test02AddingReceptiveAccountWithBalanceToPortfolioReflectsCorrectBalance

	| portfolio account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.
	portfolio add: account.
		
	self assert: 100 * peso equals: portfolio balance
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:00:02'!
test03AddingMoreThanOneReceptiveAccountWithBalanceToPortfolioReflectsCorrectBalance

	| portfolio anAccount anotherAccount |
	
	anAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 150 * peso on: anotherAccount.
	
	portfolio := Portfolio new.
	portfolio add: anAccount.
	portfolio add: anotherAccount.
		
	self assert: 250 * peso equals: portfolio balance
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:00:37'!
test04AddingPortfolioAccountsToPortfolioReflectsCorrectBalance

	| anAccount anotherAccount aPortfolio anotherPortfolio portfolioWithPortfolios |
	
	anAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 150 * peso on: anotherAccount.
	
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	aPortfolio add: anAccount.
	anotherPortfolio add: anotherAccount.
	
	portfolioWithPortfolios := Portfolio new.
	
	portfolioWithPortfolios add: aPortfolio.
	portfolioWithPortfolios add: anotherPortfolio.
	
	self assert: 250 * peso equals: portfolioWithPortfolios balance
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 14:25:33'!
test05PortfolioHasNoRegisteredTransactionsIfAccountsHaveNoTransactions
	
	| portfolio account |
	
	account := ReceptiveAccount  new.	
	
	portfolio := Portfolio new.
	portfolio add: account.

	self deny: (portfolio hasRegistered: (Deposit for: 150 * peso)).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:25:11'!
test06AddingAccountWithTransactionsToPortfolioRegistersTransactions

	| portfolio account deposit withdrawal |
	
	account := ReceptiveAccount  new.	
	
	portfolio := Portfolio new.
	portfolio add: account.
	
	deposit := Deposit register: 100 * peso on: account.
	withdrawal := Withdraw register: 150 * peso on: account.

	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdrawal).
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 14:57:25'!
test07AddingPortfolioWithTransactionsToPortfolioRegistersTransactions

	| anAccount anotherAccount deposit1 deposit2 aPortfolio anotherPortfolio portfolioWithPortfolios |
	
	anAccount := ReceptiveAccount  new.
	deposit1 := Deposit register: 100 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	deposit2 := Deposit register: 150 * peso on: anotherAccount.
	
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	aPortfolio add: anAccount.
	anotherPortfolio add: anotherAccount.
	
	portfolioWithPortfolios := Portfolio new.
	
	portfolioWithPortfolios add: aPortfolio.
	portfolioWithPortfolios add: anotherPortfolio.
	
	self assert: (portfolioWithPortfolios hasRegistered: deposit1).
	self assert: (portfolioWithPortfolios hasRegistered: deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:06:22'!
test08PortfolioWithReceptiveAccountsKnowsItsTransactions 

	| account deposit portfolio |
	
	account := ReceptiveAccount  new.
	deposit := Deposit register: 100 * peso on: account.

	portfolio := Portfolio new.
	portfolio add: account.

	self assert: (portfolio transactions includes: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:06:49'!
test09PortfolioWithPortfoliosKnowsItsTransactions

	| anAccount anotherAccount deposit1 deposit2 aPortfolio anotherPortfolio portfolioWithPortfolios |
	
	anAccount := ReceptiveAccount  new.
	deposit1 := Deposit register: 100 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	deposit2 := Deposit register: 150 * peso on: anotherAccount.
	
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	aPortfolio add: anAccount.
	anotherPortfolio add: anotherAccount.
	
	portfolioWithPortfolios := Portfolio new.
	
	portfolioWithPortfolios add: aPortfolio.
	portfolioWithPortfolios add: anotherPortfolio.
	
	self assert: (portfolioWithPortfolios transactions includes: deposit1).
	self assert: (portfolioWithPortfolios transactions includes: deposit2).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:19:22'!
test10PortfolioCannotAddItselfAsAccount

	| account portfolio |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.
	
	portfolio add: account.
	
	self should: [portfolio add: portfolio]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = portfolio class cannotAddSelfError ].! !

!PortfolioTest methodsFor: 'tests' stamp: 'PG 6/9/2022 15:33:39'!
test11PortfolioCannotAddAnExistingAccount

	| account portfolio |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.
	
	portfolio add: account.
	
	self should: [portfolio add: account]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = portfolio class cannotAddExistingAccountToPortfolioError ].
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'PG 6/8/2022 22:32:08'!
test01ATransferDeductsBalanceFromSenderAccount

	| sender recipient amount |
	
	sender := ReceptiveAccount new.
	recipient := ReceptiveAccount new.	
	amount := 150 * peso.
	
	Deposit register: 200 * peso on: sender.	
	Transfer withTransferFrom: sender to: recipient with: amount.
	
	self assert: 50 * peso equals: sender balance.	

	
	! !

!TransferTest methodsFor: 'tests' stamp: 'PG 6/8/2022 21:58:54'!
test02ATransferAddsDeductedBalanceFromSenderAccountToBalanceToRecipientAccount

	| sender recipient amount |
	
	sender := ReceptiveAccount new.
	recipient := ReceptiveAccount new.	
	amount := 150 * peso.	
		
	Deposit register: 200 * peso on: sender.
	Transfer withTransferFrom: sender to: recipient with: amount.
	
	self assert: 50 * peso equals: sender balance.	
	self assert: 150 * peso equals: recipient balance.
! !

!TransferTest methodsFor: 'tests' stamp: 'PG 6/8/2022 21:55:55'!
test03ATransferHasAValue

	| sender recipient amount |
	
	sender := ReceptiveAccount new.
	recipient := ReceptiveAccount new.	
	amount := 100 * peso.
	
	self assert: amount equals: (Transfer withTransferFrom: sender to: recipient with: amount) value. 
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'PG 6/8/2022 23:15:56'!
test04DepositTestHasACounterpart

	| sender recipient amount transfer |
	
	sender := ReceptiveAccount new.
	recipient := ReceptiveAccount new.	
	amount := 100 * peso.
	
	transfer := Transfer withTransferFrom: sender to: recipient with: amount.

	self assert: transfer depositLeg equals: transfer withdrawalLeg depositLeg.! !

!TransferTest methodsFor: 'tests' stamp: 'PG 6/8/2022 23:16:06'!
test05WithdrawalLegHasACounterpart

	| sender recipient amount transfer |
	
	sender := ReceptiveAccount new.
	recipient := ReceptiveAccount new.	
	amount := 100 * peso.
	
	transfer := Transfer withTransferFrom: sender to: recipient with: amount.

	self assert: transfer withdrawalLeg equals: transfer depositLeg withdrawalLeg.! !

!TransferTest methodsFor: 'tests' stamp: 'PG 6/8/2022 23:27:21'!
test06ATransferAmountMustBeDifferentThanZero

	| sender recipient |
	
	sender := ReceptiveAccount new.
	recipient := ReceptiveAccount new.		
	
	self should: [Transfer withTransferFrom: sender to: recipient with: 0 * peso ]
		raise: Error 
		withExceptionDo: [ : anError | 
			self assert: anError messageText = Transfer transferCannotBeZeroError].
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'PG 6/9/2022 15:09:50'!
addAllTransactionsTo: transactions

	self subclassResponsibility.
! !

!Account methodsFor: 'main protocol' stamp: 'PG 6/9/2022 15:10:15'!
balance

	self subclassResponsibility.
! !

!Account methodsFor: 'main protocol' stamp: 'PG 6/9/2022 15:10:30'!
hasRegistered: aTransaction

	self subclassResponsibility.
! !

!Account methodsFor: 'main protocol' stamp: 'PG 6/9/2022 15:10:19'!
transactions

	self subclassResponsibility.
! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'PG 6/9/2022 15:54:01'!
add: anAccount
	
	(self = anAccount) ifTrue: [^self error: self class cannotAddSelfError.].	
	(accounts includes: anAccount) ifTrue: [^self error: self class cannotAddExistingAccountToPortfolioError.].

	accounts add: anAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'PG 6/9/2022 14:43:05'!
addAllTransactionsTo: transactions

	accounts do: [ :anAccount | anAccount addAllTransactionsTo: transactions ].
! !

!Portfolio methodsFor: 'main protocol' stamp: 'PG 6/8/2022 23:55:18'!
balance

	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'PG 6/9/2022 15:21:42'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].
! !

!Portfolio methodsFor: 'main protocol' stamp: 'PG 6/9/2022 14:43:05'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	
	accounts do: [ :anAccount | anAccount addAllTransactionsTo: transactions].
	
	^transactions.
	! !


!Portfolio methodsFor: 'initialization' stamp: 'PG 6/8/2022 23:54:04'!
initialize

	accounts := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'PG 6/9/2022 15:15:54'!
cannotAddExistingAccountToPortfolioError

	^'Cannot add existing account to portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'PG 6/9/2022 15:15:16'!
cannotAddSelfError

	^'Cannot add itself to portoflio'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'PG 6/9/2022 14:47:07'!
addAllTransactionsTo: aCollection
	
	aCollection addAll: transactions.
	
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'PG 6/8/2022 22:07:25'!
balance

	^transactions sum: [ :aTransaction | aTransaction affectBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'PG 6/8/2022 22:07:25'!
affectBalance 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'PG 6/8/2022 22:07:25'!
affectBalance

	^ self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'PG 6/8/2022 22:22:09'!
initializeWith: aTransfer

	transfer := aTransfer.! !


!TransferLeg methodsFor: 'value' stamp: 'PG 6/8/2022 22:59:23'!
value

	^ transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'PG 6/8/2022 23:23:30'!
register: aTransfer on: anAccount

	| transfer |
	
	transfer := self new initializeWith: aTransfer.
	anAccount register: transfer.
		
	^ transfer.
! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'value' stamp: 'PG 6/8/2022 22:59:45'!
affectBalance

	^ self value.! !

!DepositLeg methodsFor: 'value' stamp: 'PG 6/8/2022 22:33:24'!
withdrawalLeg

	^transfer withdrawalLeg.! !


!classDefinition: #WithdrawalLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #WithdrawalLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawalLeg methodsFor: 'value' stamp: 'PG 6/8/2022 22:30:57'!
affectBalance

	^ self value negated.! !

!WithdrawalLeg methodsFor: 'value' stamp: 'PG 6/8/2022 22:15:35'!
depositLeg

	^transfer depositLeg.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'PG 6/8/2022 22:07:25'!
affectBalance

	^ self value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawalLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'PG 6/8/2022 23:20:47'!
initializeWithWithdrawalLeg: aWithdrawalLeg andDepositLeg: aDepositLeg withAmount: anAmount

	value := anAmount.
	depositLeg := aDepositLeg.
	withdrawalLeg := aWithdrawalLeg.
! !


!Transfer methodsFor: 'value' stamp: 'PG 6/8/2022 21:38:33'!
value

	^value.! !


!Transfer methodsFor: 'accessing' stamp: 'PG 6/8/2022 22:14:34'!
depositLeg

	^depositLeg.! !

!Transfer methodsFor: 'accessing' stamp: 'PG 6/8/2022 22:34:22'!
withdrawalLeg

	^withdrawalLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'PG 6/8/2022 22:47:03'!
transferCannotBeZeroError

	^'Transfer must be for a value different than 0'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'PG 6/8/2022 23:20:47'!
withTransferFrom: sender to: recipient with: anAmount
	
	| transfer depositLeg withdrawalLeg |

	(anAmount = 0) ifTrue: [self error: self transferCannotBeZeroError.].
	
	transfer := self new.
	
	depositLeg := DepositLeg register: transfer on: recipient.
	withdrawalLeg := WithdrawalLeg register: transfer on: sender.
	
	^transfer initializeWithWithdrawalLeg: withdrawalLeg andDepositLeg: depositLeg withAmount: anAmount.
! !
