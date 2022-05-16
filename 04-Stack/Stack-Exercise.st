!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'PG 5/12/2022 20:06:48'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |

	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptySentencesStack filledSentencesStack sentenceFinderByPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 19:58:48'!
setUp
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	emptySentencesStack := OOStack new.
	
	filledSentencesStack := OOStack new.
	filledSentencesStack push: 'winter is coming'.
	filledSentencesStack push: 'winning is everything'.
	filledSentencesStack push: 'The winds of Winter'.
	filledSentencesStack push: 'Winter is here'.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 20:08:09'!
test01FailsFindingAPrefixOnAnEmptyStack

	| result |
	
	result := sentenceFinderByPrefix find: 'win' in: emptySentencesStack .
	
	self assert: result size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:07:59'!
test02HasSuccessFindingASentenceThatStartsWithAPrefix

	| result |
	
	result := sentenceFinderByPrefix find: 'winning' in: filledSentencesStack .
	
	self assert: result size equals: 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:13:30'!
test03SentenceFinderIsCaseSensitive

	| result |
	
	result := sentenceFinderByPrefix find: 'Wint' in: filledSentencesStack .
	
	self assert: result size equals: 1.
	self assert: result includes: 'Winter is here'.
	
	self deny: (result includes: 'winter is coming').
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:14:20'!
test04HasSuccessFindingSeveralSentencesThatStartWithAPrefix

	| result |
	
	result := sentenceFinderByPrefix find: 'win' in: filledSentencesStack .
	
	self assert: result size equals: 2.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:35:01'!
test05ThrowsErrorWhenTryingToFindASentenceWithAPrefixWithBlankSpaces

	self 
	should: [ sentenceFinderByPrefix find: 'winter is' in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixBlankSpacesErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:34:36'!
test06ThrowsErrorWhenTryingToFindASentenceWithAnEmptyPrefix

	self 
	should: [ sentenceFinderByPrefix find: '' in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:46:37'!
test07SentenceFinderDoesNotAlterStackOrder
	
	sentenceFinderByPrefix find: 'win' in: filledSentencesStack .

	self assert: filledSentencesStack top equals: 'Winter is here'.
	
	self assert: filledSentencesStack pop equals: 'Winter is here'.
	self assert: filledSentencesStack pop equals: 'The winds of Winter'.
	self assert: filledSentencesStack pop equals: 'winning is everything'.
	self assert: filledSentencesStack pop equals: 'winter is coming'.
	self assert: filledSentencesStack isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:55:09'!
test08SentenceFinderDoesNotAcceptObjectsDifferentThanStrings
	
	self 
	should: [ sentenceFinderByPrefix find: 10 in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixNotStringErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:00:53'!
test09SentenceFinderDoesNotAcceptStacksDifferentThanOOStack
	
	| collection |
	
	collection := OrderedCollection new.
	collection add: 'winter is here'.
	collection add: 'Winter is coming'.
	
	self
	should: [ sentenceFinderByPrefix find: 'win' in: collection. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix stackNotStackTypeErrorDescription equals: anError messageText ].
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:08:37'!
test10FailsFindingAPrefixOnAStackWithoutSentencesStartingWithThatPrefix

	| result |
	
	result := sentenceFinderByPrefix find: 'summer' in: filledSentencesStack .
	
	self assert: result size equals: 0.
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'helpers' stamp: 'PG 5/15/2022 17:37:30'!
last

	^contents last.! !

!OOStack methodsFor: 'helpers' stamp: 'PG 5/15/2022 17:37:00'!
removeLast	
	
	^contents removeLast.
! !

!OOStack methodsFor: 'helpers' stamp: 'PG 5/15/2022 20:50:38'!
setState

	state := OOStackState with: self size.


! !


!OOStack methodsFor: 'initialization' stamp: 'PG 5/15/2022 20:49:40'!
initialize

	contents := OrderedCollection new.
	self setState.
! !


!OOStack methodsFor: 'adding' stamp: 'PG 5/15/2022 20:53:18'!
push: aValue
	
	contents add: aValue.
	self setState.
! !


!OOStack methodsFor: 'removing' stamp: 'PG 5/15/2022 20:55:16'!
pop
	
	| object |	
	
	object := state popFrom: self.
	self setState.

	^object.
! !


!OOStack methodsFor: 'accessing' stamp: 'PG 5/15/2022 20:44:30'!
isEmpty
	
	^state isEmpty.
! !

!OOStack methodsFor: 'accessing' stamp: 'PG 5/12/2022 20:28:46'!
size

	^contents size.! !

!OOStack methodsFor: 'accessing' stamp: 'PG 5/15/2022 20:48:37'!
top

	^state topFrom: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'PG 5/12/2022 20:50:52'!
isEmpty

	self subclassResponsibility.! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 18:47:55'!
popFrom: aStack

	self subclassResponsibility.! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 18:48:00'!
topFrom: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 16:54:34'!
with: aValue

	| stackStateSubclass |
	
	stackStateSubclass := (OOStackState subclasses) detect: [:subclass | subclass includes: aValue].
	
	^stackStateSubclass new.! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'PG 5/12/2022 20:47:22'!
isEmpty

	^true.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 16:42:53'!
popFrom: aStack

	self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 16:42:42'!
topFrom: aStack

	self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: 'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 16:56:38'!
includes: aValue

	^aValue = 0.! !


!classDefinition: #OOStackNotEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'PG 5/12/2022 20:47:14'!
isEmpty

	^false! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 17:37:10'!
popFrom: aStack
	
	^aStack removeLast.
! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 17:37:52'!
topFrom: aStack

	^aStack last.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: 'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 16:56:48'!
includes: aValue

	^aValue > 0.! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:31:11'!
validatePrefix
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 23:28:48'!
with: aPrefix

	| prefixSubclass prefixSubclasses |
	
	"
	prefixSubclasses := OrderedCollection new.
	
	prefixSubclasses add: PrefixNotString.
	prefixSubclasses add: PrefixWithSpaces.
	prefixSubclasses add: PrefixBlank.
	prefixSubclasses add: PrefixString.
	"
	
	prefixSubclasses := {PrefixNotString. PrefixWithSpaces. PrefixBlank. PrefixString } asOrderedCollection.

	prefixSubclass := (prefixSubclasses) detect: [:subclass | subclass validates: aPrefix].

	^prefixSubclass new.
! !


!classDefinition: #PrefixBlank category: 'Stack-Exercise'!
Prefix subclass: #PrefixBlank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixBlank methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:32:21'!
validatePrefix

	^self error: SentenceFinderByPrefix prefixEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixBlank class' category: 'Stack-Exercise'!
PrefixBlank class
	instanceVariableNames: ''!

!PrefixBlank class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:20:03'!
validates: aPrefix

	^aPrefix = ''! !


!classDefinition: #PrefixNotString category: 'Stack-Exercise'!
Prefix subclass: #PrefixNotString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixNotString methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:38:15'!
validatePrefix
	
	^self error: SentenceFinderByPrefix prefixNotStringErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixNotString class' category: 'Stack-Exercise'!
PrefixNotString class
	instanceVariableNames: ''!

!PrefixNotString class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:39:43'!
validates: aPrefix

	^((aPrefix isKindOf: String) not).! !


!classDefinition: #PrefixString category: 'Stack-Exercise'!
Prefix subclass: #PrefixString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixString methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:37:18'!
validatePrefix

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixString class' category: 'Stack-Exercise'!
PrefixString class
	instanceVariableNames: ''!

!PrefixString class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:36:51'!
validates: aPrefix

	^aPrefix isKindOf: String.! !


!classDefinition: #PrefixWithSpaces category: 'Stack-Exercise'!
Prefix subclass: #PrefixWithSpaces
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixWithSpaces methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:33:09'!
validatePrefix

	^self error: SentenceFinderByPrefix prefixBlankSpacesErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixWithSpaces class' category: 'Stack-Exercise'!
PrefixWithSpaces class
	instanceVariableNames: ''!

!PrefixWithSpaces class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:20:08'!
validates: aPrefix

	^aPrefix includesSubString: ' '.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 23:03:41'!
find: aPrefix in: aStack

	| auxStack prefix |
	
	prefix := Prefix with: aPrefix.

	self validateStack: aStack.
	prefix validatePrefix.
	
	auxStack := OOStack new.
		
	self goOver: aStack andAddSentencesTo: auxStack searching: aPrefix.
	self goOver: auxStack andMoveElementsTo: aStack.

	^sentences.
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 23:00:57'!
goOver: aStack andAddSentencesTo: anotherStack searching: aPrefix

	| sentence |

	aStack size timesRepeat: [
		sentence := aStack pop.
		anotherStack push: sentence.
		
		(sentence beginsWith: aPrefix) ifTrue: [
			sentences add: sentence.
		].
	].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 23:03:20'!
goOver: aStack andMoveElementsTo: anotherStack

	| sentence |
	
	aStack size timesRepeat: [
		sentence := aStack pop.
		anotherStack push: sentence.
	].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 19:17:55'!
initialize

	sentences := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 22:52:14'!
validateStack: aStack

	(aStack isKindOf: OOStack) ifFalse: [^self error: SentenceFinderByPrefix stackNotStackTypeErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:20:25'!
prefixBlankSpacesErrorDescription

	^'Prefix cannot have blank spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:32:55'!
prefixEmptyErrorDescription

	^'Prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:48:50'!
prefixNotStringErrorDescription

	^'Prefix should be a string'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PG 5/15/2022 21:57:47'!
stackNotStackTypeErrorDescription

	^'Stack should be of type stack'
! !
