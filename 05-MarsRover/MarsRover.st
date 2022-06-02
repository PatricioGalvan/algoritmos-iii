!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverFacingSouth marsRoverFacingWest marsRoverFacingNorth marsRoverFacingEast'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'helpers' stamp: 'PG 6/2/2022 16:56:07'!
assertIf: aMarsRover isOnPosition: aPosition whileFacingDirection: aDirection	
	
	self assert: (aMarsRover position = aPosition).
	self assert: (aMarsRover direction = aDirection).
! !

!MarsRoverTests methodsFor: 'helpers' stamp: 'PG 6/2/2022 16:56:51'!
assertIf: aMarsRover isOnPosition: aPosition whileFacingDirection: aDirection afterProcessingCommand: aCommand	
	
	aMarsRover processCommands: aCommand.		
	self assertIf: aMarsRover isOnPosition: aPosition whileFacingDirection: aDirection.
! !

!MarsRoverTests methodsFor: 'helpers' stamp: 'PG 6/2/2022 17:10:18'!
assertThat: aMarsRover shouldProcess: commands withInvalidCommandsAndArriveToPosition: aPosition whileFacingDirection: aDirection
					
	self should: [aMarsRover processCommands: commands]
		raise: Error
			withExceptionDo: [ :aMessage | 
				self assert: aMessage messageText = MarsRover invalidCommandError.				
				self assertIf: aMarsRover isOnPosition: aPosition whileFacingDirection: aDirection.
			].
! !


!MarsRoverTests methodsFor: 'setUp' stamp: 'PG 6/2/2022 16:06:54'!
setUp	

	marsRoverFacingSouth := MarsRover newWithCoordinateX: 2 AndCoordinateY: 0 WhileFacing: $S.	
	marsRoverFacingWest := MarsRover newWithCoordinateX: 3 AndCoordinateY: 7 WhileFacing: $W.	
	marsRoverFacingNorth := MarsRover newWithCoordinateX: 0 AndCoordinateY: 0 WhileFacing: $N.
	marsRoverFacingEast := MarsRover newWithCoordinateX: 1 AndCoordinateY: 1 WhileFacing: $E.	! !


!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:57:15'!
test01MarsRoverCanBeCreatedWithInitialPositionAndDirection

	self assertIf: marsRoverFacingNorth isOnPosition: (0@0) whileFacingDirection: $N.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:49:39'!
test02MarsRoverFacingNorthCanRecieveCommandToMoveForwardWhileMaintainingDirection	
	
	self assertIf: marsRoverFacingNorth isOnPosition: (0@1) whileFacingDirection: $N afterProcessingCommand: 'f'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:49:53'!
test03MarsRoverFacingNorthCanRecieveCommandToMoveBackwardsWhileMaintaningDirection	

	self assertIf: marsRoverFacingNorth isOnPosition: (0@-1) whileFacingDirection: $N afterProcessingCommand: 'b'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:50:16'!
test04MarsRoverFacingNorthCanRecieveCommandToRotateToTheLeftWhileMaintainingPosition	
		
	self assertIf: marsRoverFacingNorth isOnPosition: (0@0) whileFacingDirection: $W afterProcessingCommand: 'l'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:50:36'!
test05MarsRoverFacingNorthCanRecieveCommandToRotateToTheRightWhileMaintainingPosition

	self assertIf: marsRoverFacingNorth isOnPosition: (0@0) whileFacingDirection: $E afterProcessingCommand: 'r'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:57:39'!
test06MarsRoverCanBeCreatedWithDifferentPositionAndDirection

	self assertIf: marsRoverFacingWest isOnPosition: (3@7) whileFacingDirection: $W.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:51:14'!
test07MarsRoverFacingAnyDirectionCanRecieveCommandToMoveForwardWhileMaintainingDirection	
	
	self assertIf: marsRoverFacingEast isOnPosition: (2@1) whileFacingDirection: $E afterProcessingCommand: 'f'.

! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:51:35'!
test08MarsRoverFacingAnyDirectionCanRecieveCommandToMoveBackwardsWhileMaintaningDirection	
		
	self assertIf: marsRoverFacingWest isOnPosition: (4@7) whileFacingDirection: $W afterProcessingCommand: 'b'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:52:01'!
test09MarsRoverFacingAnyDirectionCanRecieveCommandToRotateToTheLeftWhileMaintainingPosition	

	self assertIf: marsRoverFacingSouth isOnPosition: (2@0) whileFacingDirection: $E afterProcessingCommand: 'l'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:52:29'!
test10MarsRoverFacingAnyDirectionCanRecieveCommandToRotateToTheRightWhileMaintainingPosition
			
	self assertIf: marsRoverFacingWest isOnPosition: (3@7) whileFacingDirection: $N afterProcessingCommand: 'r'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:52:54'!
test11MarsRoverCanRecieveMultipleCommandsToMoveBackwardsWhileMaintainingDirection	

	self assertIf: marsRoverFacingWest isOnPosition: (5@7) whileFacingDirection: $W afterProcessingCommand: 'bb'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:53:14'!
test12MarsRoverCanRecieveMultipleCommandsToMoveForwardWhileMaintainingDirection	
	
	self assertIf: marsRoverFacingWest isOnPosition: (1@7) whileFacingDirection: $W afterProcessingCommand: 'ff'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:53:31'!
test13MarsRoverCanRecieveMultipleCommandsToRotateToTheLeftWhileMaintainingPosition	
		
	self assertIf: marsRoverFacingWest isOnPosition: (3@7) whileFacingDirection: $E afterProcessingCommand: 'll'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:53:50'!
test14MarsRoverCanRecieveMultipleCommandsToRotateToTheRightWhileMaintainingPosition

	self assertIf: marsRoverFacingWest isOnPosition: (3@7) whileFacingDirection: $E afterProcessingCommand: 'rr'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:54:29'!
test15MarsRoverCanRecieveMultipleCommandsToMoveBackAndForthWhileMaintainingDirection
	
	self assertIf: marsRoverFacingSouth isOnPosition: (2@-3) whileFacingDirection: $S afterProcessingCommand: 'bffbfff'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:55:08'!
test16MarsRoverCanRecieveMultipleCommandsToRotateLeftAndRightWhileMaintainingPosition
		
	self assertIf: marsRoverFacingSouth isOnPosition: (2@0) whileFacingDirection: $E afterProcessingCommand: 'rrlrrrl'.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 16:55:27'!
test17MarsRoverCanRecieveMultipleCommandsMoveAndRotateInDifferentDirections
		
	self assertIf: marsRoverFacingEast isOnPosition: (4@5) whileFacingDirection: $S afterProcessingCommand: 'fflffrfrbb'.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 17:11:05'!
test18MarsRoverCanRecieveAnInvalidCommandButDoesNotExecuteIt

	self assertThat: marsRoverFacingNorth shouldProcess: 'x' withInvalidCommandsAndArriveToPosition: (0@0) whileFacingDirection: $N.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 17:11:34'!
test19MarsRoverCanRecieveMultipleCommandsThatIncludeAnInvalidCommandAndExecutesTheValidOnesUntilStoppingAfterEncounteringTheInvalidCommand

	self assertThat: marsRoverFacingNorth shouldProcess: 'fflxffffrrb' withInvalidCommandsAndArriveToPosition: (0@2) whileFacingDirection: $W.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'PG 6/2/2022 17:39:36'!
test20MarsRoverCannotBeCreatedIfDirectionIsInvalid
	
	| marsRover |
	
	self should: [marsRover := MarsRover newWithCoordinateX: 0 AndCoordinateY: 0 WhileFacing: $X.	]
		raise: Error
			withExceptionDo: [ :aMessage | 
				self assert: aMessage messageText = MarsRoverAxis invalidDirectionError.				
			].
! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'PG 6/2/2022 17:16:16'!
initializeWithCoordinateX: positionX AndCoordinateY: positionY WhileFacing: aDirection.

	position := positionX @ positionY.
	direction := MarsRoverAxis newWith: aDirection.
	! !


!MarsRover methodsFor: 'moving commands' stamp: 'PG 6/2/2022 14:17:59'!
moveEast
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving commands' stamp: 'PG 6/2/2022 14:18:22'!
moveNorth
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving commands' stamp: 'PG 6/2/2022 14:18:34'!
moveSouth
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving commands' stamp: 'PG 6/2/2022 14:18:51'!
moveWest
	position := position + (-1@0)! !


!MarsRover methodsFor: 'accessing' stamp: 'PG 6/2/2022 14:40:23'!
direction

	^direction value.! !

!MarsRover methodsFor: 'accessing' stamp: 'PG 6/2/2022 15:55:00'!
position

	^position! !


!MarsRover methodsFor: 'direction commands' stamp: 'PG 6/2/2022 14:26:03'!
faceEast

	^direction := MarsRoverEastAxis new.! !

!MarsRover methodsFor: 'direction commands' stamp: 'PG 6/2/2022 14:25:45'!
faceNorth

	^direction := MarsRoverNorthAxis new.! !

!MarsRover methodsFor: 'direction commands' stamp: 'PG 6/2/2022 15:16:53'!
faceSouth

	^direction := MarsRoverSouthAxis new.! !

!MarsRover methodsFor: 'direction commands' stamp: 'PG 6/2/2022 14:25:34'!
faceWest

	^direction := MarsRoverWestAxis new.! !


!MarsRover methodsFor: 'commanding' stamp: 'PG 6/2/2022 15:10:17'!
executeCommand: aCommand
	
	(aCommand = $f) ifTrue: [^direction moveForward: self.].
	(aCommand = $b) ifTrue: [^direction moveBackwards: self.].
	(aCommand = $l) ifTrue: [^direction rotateLeft: self.].
	(aCommand = $r) ifTrue: [^direction rotateRight: self.].
	
	self error: self class invalidCommandError.! !

!MarsRover methodsFor: 'commanding' stamp: 'PG 6/2/2022 15:08:42'!
processCommands: commands

	commands do: [ :aCommand | self executeCommand: aCommand].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 15:10:06'!
invalidCommandError

	^'Invalid Command'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 14:12:21'!
newWithCoordinateX: positionX AndCoordinateY: positionY WhileFacing: aDirection.

	^self new initializeWithCoordinateX: positionX AndCoordinateY: positionY WhileFacing: aDirection.! !


!classDefinition: #MarsRoverAxis category: 'MarsRover'!
Object subclass: #MarsRoverAxis
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:39:24'!
rotateLeft: aMarsRover

	self subclassResponsibility.! !

!MarsRoverAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:39:27'!
rotateRight: aMarsRover

	self subclassResponsibility.! !


!MarsRoverAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:39:19'!
moveBackwards: aMarsRover

	self subclassResponsibility.! !

!MarsRoverAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:39:22'!
moveForward: aMarsRover

	self subclassResponsibility.! !


!MarsRoverAxis methodsFor: 'accessing' stamp: 'PG 6/2/2022 14:39:45'!
value
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverAxis class' category: 'MarsRover'!
MarsRoverAxis class
	instanceVariableNames: ''!

!MarsRoverAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 13:32:40'!
canInstanceWith: aCardinalDirection

	self subclassResponsibility.! !

!MarsRoverAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 17:33:41'!
invalidDirectionError

	^'Invalid Directionq'! !

!MarsRoverAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 17:33:07'!
newWith: aCardinalDirection

	| subclass |

	subclass := self subclasses detect: [ :aSubclass | aSubclass canInstanceWith: aCardinalDirection] ifNone: [^self error: MarsRoverAxis invalidDirectionError.].

	^subclass new.
! !


!classDefinition: #MarsRoverEastAxis category: 'MarsRover'!
MarsRoverAxis subclass: #MarsRoverEastAxis
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverEastAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:26:51'!
rotateLeft: aMarsRover
	
	aMarsRover faceNorth.! !

!MarsRoverEastAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:27:12'!
rotateRight: aMarsRover
	
	aMarsRover faceSouth.! !


!MarsRoverEastAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 17:27:12'!
moveBackwards: aMarsRover

	aMarsRover moveWest.! !

!MarsRoverEastAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 17:27:15'!
moveForward: aMarsRover

	aMarsRover moveEast.! !


!MarsRoverEastAxis methodsFor: 'accessing' stamp: 'PG 6/2/2022 14:39:56'!
value
	
	^$E.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverEastAxis class' category: 'MarsRover'!
MarsRoverEastAxis class
	instanceVariableNames: ''!

!MarsRoverEastAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 13:33:15'!
canInstanceWith: aCardinalDirection

	^aCardinalDirection = $E.! !


!classDefinition: #MarsRoverNorthAxis category: 'MarsRover'!
MarsRoverAxis subclass: #MarsRoverNorthAxis
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverNorthAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:34:27'!
rotateLeft: aMarsRover
	
	aMarsRover faceWest.! !

!MarsRoverNorthAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:34:35'!
rotateRight: aMarsRover
	
	aMarsRover faceEast.! !


!MarsRoverNorthAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:37:21'!
moveBackwards: aMarsRover

	aMarsRover moveSouth.! !

!MarsRoverNorthAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:21:40'!
moveForward: aMarsRover

	aMarsRover moveNorth.! !


!MarsRoverNorthAxis methodsFor: 'accessing' stamp: 'PG 6/2/2022 14:40:03'!
value
	
	^$N.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverNorthAxis class' category: 'MarsRover'!
MarsRoverNorthAxis class
	instanceVariableNames: ''!

!MarsRoverNorthAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 13:33:28'!
canInstanceWith: aCardinalDirection

	^aCardinalDirection = $N.! !


!classDefinition: #MarsRoverSouthAxis category: 'MarsRover'!
MarsRoverAxis subclass: #MarsRoverSouthAxis
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverSouthAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:34:56'!
rotateLeft: aMarsRover
	
	aMarsRover faceEast.! !

!MarsRoverSouthAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:34:47'!
rotateRight: aMarsRover
	
	aMarsRover faceWest.! !


!MarsRoverSouthAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:37:21'!
moveBackwards: aMarsRover

	aMarsRover moveNorth.! !

!MarsRoverSouthAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:21:54'!
moveForward: aMarsRover

	aMarsRover moveSouth.! !


!MarsRoverSouthAxis methodsFor: 'accessing' stamp: 'PG 6/2/2022 14:40:10'!
value
	
	^$S.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverSouthAxis class' category: 'MarsRover'!
MarsRoverSouthAxis class
	instanceVariableNames: ''!

!MarsRoverSouthAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 13:33:33'!
canInstanceWith: aCardinalDirection

	^aCardinalDirection = $S.! !


!classDefinition: #MarsRoverWestAxis category: 'MarsRover'!
MarsRoverAxis subclass: #MarsRoverWestAxis
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverWestAxis methodsFor: 'accessing' stamp: 'PG 6/2/2022 14:40:14'!
value
	
	^$W.! !


!MarsRoverWestAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:27:35'!
rotateLeft: aMarsRover
	
	aMarsRover faceSouth.! !

!MarsRoverWestAxis methodsFor: 'rotating' stamp: 'PG 6/2/2022 14:27:26'!
rotateRight: aMarsRover
	
	aMarsRover faceNorth.! !


!MarsRoverWestAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:37:21'!
moveBackwards: aMarsRover

	aMarsRover moveEast.! !

!MarsRoverWestAxis methodsFor: 'moving' stamp: 'PG 6/2/2022 14:22:04'!
moveForward: aMarsRover

	aMarsRover moveWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWestAxis class' category: 'MarsRover'!
MarsRoverWestAxis class
	instanceVariableNames: ''!

!MarsRoverWestAxis class methodsFor: 'as yet unclassified' stamp: 'PG 6/2/2022 13:33:38'!
canInstanceWith: aCardinalDirection

	^aCardinalDirection = $W.! !
