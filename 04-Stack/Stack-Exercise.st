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

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'PG 5/15/2022 19:58:48'!
setUp
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	emptySentencesStack := OOStack new.
	
	filledSentencesStack := OOStack new.
	filledSentencesStack push: 'winter is coming'.
	filledSentencesStack push: 'winning is everything'.
	filledSentencesStack push: 'The winds of Winter'.
	filledSentencesStack push: 'Winter is here'.
! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:31:44'!
test01FailsFindingAPrefixOnAnEmptyStack

	| filteredSentences |
	
	filteredSentences := sentenceFinderByPrefix find: 'win' in: emptySentencesStack .
	
	self assert: filteredSentences size equals: 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:31:34'!
test02FailsFindingAPrefixOnAStackWithoutSentencesStartingWithThatPrefix

	| filteredSentences |
	
	filteredSentences := sentenceFinderByPrefix find: 'summer' in: filledSentencesStack .
	
	self assert: filteredSentences size equals: 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:31:22'!
test03HasSuccessFindingASentenceThatStartsWithAPrefix

	| filteredSentences |
	
	filteredSentences := sentenceFinderByPrefix find: 'winning' in: filledSentencesStack .
	
	self assert: filteredSentences size equals: 1.
	self assert: filteredSentences includes: 'winning is everything'.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:34:22'!
test04HasSuccessFindingSeveralSentencesThatStartWithAPrefix

	| filteredSentences |
	
	filteredSentences := sentenceFinderByPrefix find: 'win' in: filledSentencesStack .
	
	self assert: filteredSentences size equals: 2.
	self assert: filteredSentences includes: 'winning is everything'.
	self assert: filteredSentences includes: 'winter is coming'.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:36:05'!
test05SentenceFinderIsCaseSensitive

	| filteredSentences |
	
	filteredSentences := sentenceFinderByPrefix find: 'Wint' in: filledSentencesStack .
	
	self assert: filteredSentences size equals: 1.
	self assert: filteredSentences includes: 'Winter is here'.
	self deny: (filteredSentences includes: 'winter is coming').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:23:08'!
test06SentenceFinderDoesNotAlterStackOrder
	
	sentenceFinderByPrefix find: 'win' in: filledSentencesStack .

	self assert: filledSentencesStack top equals: 'Winter is here'.
	
	self assert: filledSentencesStack pop equals: 'Winter is here'.
	self assert: filledSentencesStack pop equals: 'The winds of Winter'.
	self assert: filledSentencesStack pop equals: 'winning is everything'.
	self assert: filledSentencesStack pop equals: 'winter is coming'.
	self assert: filledSentencesStack isEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:24:09'!
test07SentenceFinderDoesNotAcceptPrefixDifferentThanString
	
	self 
	should: [ sentenceFinderByPrefix find: 10 in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixNotStringErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 13:37:24'!
test08SentenceFinderDoesNotAcceptStacksDifferentThanOOStack
	
	| collection |
	
	collection := {'winter is here'. 'Winter is coming'} asOrderedCollection.
	
	self
	should: [ sentenceFinderByPrefix find: 'win' in: collection. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix stackNotStackTypeErrorDescription equals: anError messageText ].
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 18:14:23'!
test09ThrowsErrorWhenTryingToFindASentenceWithAPrefixContainingWhitespaces

	self 
	should: [ sentenceFinderByPrefix find: 'winter is' in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixBlankSpacesErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 18:13:58'!
test10ThrowsErrorWhenTryingToFindASentenceWithAWhitespaceAsPrefix

	self 
	should: [ sentenceFinderByPrefix find: ' ' in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixBlankSpacesErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PG 5/16/2022 18:14:33'!
test11ThrowsErrorWhenTryingToFindASentenceWithAnEmptyPrefix

	self 
	should: [ sentenceFinderByPrefix find: '' in: filledSentencesStack. ]
	raise: Error
	withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ].
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'helpers' stamp: 'PG 5/16/2022 17:59:08'!
last
	"Returns last element of the stack (top)"

	^contents last.! !

!OOStack methodsFor: 'helpers' stamp: 'PG 5/16/2022 17:59:22'!
removeLast	
	"Removes last element from the stack (top)"
	
	^contents removeLast.
! !

!OOStack methodsFor: 'helpers' stamp: 'PG 5/16/2022 18:18:23'!
setState
	"Sets state for the stack, either empty or not empty"

	state := OOStackState withSize: self size.


! !


!OOStack methodsFor: 'initialization' stamp: 'PG 5/16/2022 17:58:45'!
initialize
	"Initializes contents and state of the stack"

	contents := OrderedCollection new.
	self setState.
! !


!OOStack methodsFor: 'adding' stamp: 'PG 5/16/2022 17:56:23'!
push: aValue
	"Adds element at the top of the stack"
	
	contents add: aValue.
	self setState.
! !


!OOStack methodsFor: 'removing' stamp: 'PG 5/16/2022 17:56:13'!
pop
	"Removes last element of the stack and returns it"
	
	| object |	
	
	object := state popFrom: self.
	self setState.

	^object.
! !


!OOStack methodsFor: 'accessing' stamp: 'PG 5/16/2022 17:55:59'!
isEmpty
	"Checks if stack is empty or not"
	
	^state isEmpty.
! !

!OOStack methodsFor: 'accessing' stamp: 'PG 5/16/2022 17:55:45'!
size
	"Returns size of the stack"

	^contents size.! !

!OOStack methodsFor: 'accessing' stamp: 'PG 5/16/2022 18:04:01'!
top
	"Returns top of the stack"

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

!OOStackState methodsFor: 'accessing' stamp: 'PG 5/16/2022 18:01:34'!
isEmpty	

	self subclassResponsibility.! !

!OOStackState methodsFor: 'accessing' stamp: 'PG 5/15/2022 18:48:00'!
topFrom: aStack

	self subclassResponsibility.! !


!OOStackState methodsFor: 'removing' stamp: 'PG 5/16/2022 18:01:06'!
popFrom: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'PG 5/16/2022 18:17:45'!
withSize: aSize

	| stackStateSubclass |
	
	stackStateSubclass := (OOStackState subclasses) detect: [:subclass | subclass validates: aSize].
	
	^stackStateSubclass new.! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'accessing' stamp: 'PG 5/16/2022 18:00:30'!
isEmpty
	"Asserts that stack is empty"
	
	^true.! !

!OOStackEmpty methodsFor: 'accessing' stamp: 'PG 5/16/2022 18:02:13'!
topFrom: aStack
	"Returns error when trying to access top element from stack"

	self error: OOStack stackEmptyErrorDescription.! !


!OOStackEmpty methodsFor: 'removing' stamp: 'PG 5/16/2022 18:02:03'!
popFrom: aStack
	"Returns error when trying to pop element from stack"
	
	self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: 'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'as yet unclassified' stamp: 'PG 5/16/2022 18:17:51'!
validates: aValue

	^aValue = 0.! !


!classDefinition: #OOStackNotEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'accessing' stamp: 'PG 5/16/2022 18:00:22'!
isEmpty
	"Asserts that stack is not empty"

	^false! !

!OOStackNotEmpty methodsFor: 'accessing' stamp: 'PG 5/16/2022 18:04:29'!
topFrom: aStack
	"Returns top of a stack"

	^aStack last.
! !


!OOStackNotEmpty methodsFor: 'removing' stamp: 'PG 5/16/2022 18:04:21'!
popFrom: aStack	
	"Removes last element of a stack and returns it"
	
	^aStack removeLast.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: 'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'as yet unclassified' stamp: 'PG 5/16/2022 18:17:58'!
validates: aValue

	^aValue > 0.! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'validation' stamp: 'PG 5/16/2022 11:28:35'!
validatePrefix

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'PG 5/16/2022 12:41:37'!
with: aPrefix

	| prefixSubclass prefixSubclasses |
	
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

!PrefixBlank methodsFor: 'validation' stamp: 'PG 5/16/2022 18:05:07'!
validatePrefix
	"Throws error when prefix is blank"

	^self error: SentenceFinderByPrefix prefixEmptyErrorDescription.
! !

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

!PrefixNotString methodsFor: 'validation' stamp: 'PG 5/16/2022 18:05:28'!
validatePrefix
	"Throws error when prefix is not a string"
	
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

!PrefixString methodsFor: 'validation' stamp: 'PG 5/16/2022 18:06:15'!
validatePrefix
	"Returns something that is not an error"
	
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

!PrefixWithSpaces methodsFor: 'validation' stamp: 'PG 5/16/2022 18:05:43'!
validatePrefix
	"Throws error when prefix is has blank spaces"

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

!SentenceFinderByPrefix methodsFor: 'private helpers' stamp: 'PG 5/16/2022 18:06:51'!
checkForPossibleErrorsInStack: aStack orPrefix: aPrefix
	"Validates if both prefix and stack are valid"

	| prefix |
	
	prefix := Prefix with: aPrefix.
	
	prefix validatePrefix.
	(aStack isKindOf: OOStack) ifFalse: [^self error: SentenceFinderByPrefix stackNotStackTypeErrorDescription].
	! !

!SentenceFinderByPrefix methodsFor: 'private helpers' stamp: 'PG 5/16/2022 18:07:45'!
goThrough: aStack andMoveElementsTo: anotherStack
	"Moves all elements from a stack to another stack"

	| sentence |
	
	aStack size timesRepeat: [
		sentence := aStack pop.
		anotherStack push: sentence.
	].
! !

!SentenceFinderByPrefix methodsFor: 'private helpers' stamp: 'PG 5/16/2022 18:08:28'!
goThrough: aStack andMoveElementsTo: anotherStack searchingFor: aPrefix
	"Moves all elements from a stack to another stack while adding all sentences that match a criteria to an OrderedCollection"

	| sentence |

	aStack size timesRepeat: [
		sentence := aStack pop.
		anotherStack push: sentence.
		
		(sentence beginsWith: aPrefix) ifTrue: [
			sentences add: sentence.
		].
	].
! !

!SentenceFinderByPrefix methodsFor: 'private helpers' stamp: 'PG 5/16/2022 18:09:16'!
searchSentencesWith: aPrefix in: aStack
	"Searches for sentences matching a specific criteria while adding them to an OrderedCollection and making sure stack elements remain in the same order"
	
	| auxStack |
	
	auxStack := OOStack new.
			
	self goThrough: aStack andMoveElementsTo: auxStack searchingFor: aPrefix.
	self goThrough: auxStack andMoveElementsTo: aStack.
! !


!SentenceFinderByPrefix methodsFor: 'filtering' stamp: 'PG 5/16/2022 18:07:25'!
find: aPrefix in: aStack	
	"Returns collection with all sentences from a stack starting with a prefix"
	
	self checkForPossibleErrorsInStack: aStack orPrefix: aPrefix.
	self searchSentencesWith: aPrefix in: aStack.	

	^sentences.
! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'PG 5/16/2022 18:09:51'!
initialize
	"Initializes collection of sentences"

	sentences := OrderedCollection new.! !

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
