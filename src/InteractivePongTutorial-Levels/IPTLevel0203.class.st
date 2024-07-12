Class {
	#name : #IPTLevel0203,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:11'
}
IPTLevel0203 class >> asString [

	^ 'Level 03: Keyboard Input'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/12/2024 18:10'
}
IPTLevel0203 class >> description [
	
	^ 'In this level you will learn how to use keyboard input to interact with your game.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/12/2024 18:28'
}
IPTLevel0203 class >> explanations [
	
	^ {'In the last level we gave the player the possibility to move. In this level we want to make the player move by keyboard input. Therefore you have to enable keyboard event handling in the handlesKeyboard function of the game. Afterwards you can implement the moment with W/S for the left- and arrowUp/arrowDown for the right Player. The movement should start on keyDown and stop on keyUp.'. 'You get an Event and have to check if it triggers an explained action. You get the events character with the "keyCharacter" message. To define character you can use the Character Class or the "$" symbol like "$p".'. 'If you are unsure how to proceed or a stuck at a method there are some hints following.'. 'Hint 1: Return true in the handlesKeyboard message to enable keyboard interaction.'.'Hint 2: In keyUp/keyDown compare the keyboardEvent separatly with "Character arrayUp/arrowDown" an "$W,$S" and start/stop the movement in an "ifTrue:" block.'.'Hint 3: Use the message "asUppercase" to make sure the inputs of letters work with your comparison letter.'.'Hint 4: In the keyDown message you have different events triggering the same action. To make your code less redundant you can use the messages "or:" or "andSatisfy:". The or: message works simmilar to a logical or. The "anySatisfy:" message can be send to a collection and takes a block. If any element of the collection fits the block, "anySatisfy" will return true.' }.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:10'
}
IPTLevel0203 class >> levelIndex [

	^ 3.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 20:08'
}
IPTLevel0203 class >> visibleMethods [

	^ {
		IPTGame>>#playerLeft.
		IPTGame>>#playerRight.
		IPTGame>>#keyUp:.
		IPTGame>>#keyDown:.
		IPTGame>>#handlesKeyboard:.
		
		IPTPlayer>>#up.
		IPTPlayer>>#down.
		IPTPlayer>>#stop.
		}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 20:15'
}
IPTLevel0203 >> testGameHandlesKeyboard [
	
	self methodToBeTested: (IPTGame >> #handlesKeyboard:).
	
	self assert: (true = (game handlesKeyboard: nil)) description: 'The game is not flagged to handle keyboard.'.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 21:25'
}
IPTLevel0203 >> testGameKeyDown [
	| prevSpeedL prevSpeedR |
	
	self methodToBeTested: (IPTGame >> #keyDown:).
	
	prevSpeedR := game playerRight speed.
	game keyDown: (KeyboardEvent new keyValue: $W).
	self assert: (prevSpeedR = game playerRight speed) description: 'The right player should not be affected by $W.'.
	self assert: (game playerLeft speed = (game playerLeft up; speed)) description: 'The left player should move up when pressing $W.'.
	
	game playerLeft stop.
	game keyDown: (KeyboardEvent new keyValue: $w).
	self assert: (game playerLeft speed = (game playerLeft up; speed)) description: 'The left player should also move up when pressing $w.'.
	
	prevSpeedR := game playerRight speed.
	game keyDown: (KeyboardEvent new keyValue: $S).
	prevSpeedL := game playerLeft speed.
	self assert: (prevSpeedR = game playerRight speed) description: 'The right player should not be affected by $S.'.
	self assert: (prevSpeedL = (game playerLeft down; speed)) description: 'The left player should move up when pressing $S.'.
	
	game playerLeft stop.
	game keyDown: (KeyboardEvent new keyValue: $s).
	self assert: (game playerLeft speed = (game playerLeft down; speed)) description: 'The left player should also move down when pressing $w.'.
	
	prevSpeedL := game playerLeft speed.
	game keyDown: (KeyboardEvent new keyValue: Character arrowUp).
	prevSpeedR := game playerRight speed.
	self assert: (prevSpeedL = game playerLeft speed) description: 'The left player should not be affected by arrowUp.'.
	self assert: (prevSpeedR = (game playerRight up; speed)) description: 'The right player should move up when pressing arrowUp.'.
	
	prevSpeedL := game playerLeft speed.
	game keyDown: (KeyboardEvent new keyValue: Character arrowDown).
	prevSpeedR := game playerRight speed.
	self assert: (prevSpeedL = game playerLeft speed) description: 'The left player should not be affected by arrowDown.'.
	self assert: (prevSpeedR = (game playerRight down; speed)) description: 'The right player should move up when pressing arrowDown.'.
	
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 21:41'
}
IPTLevel0203 >> testGameKeyUp [
	| prevSpeed |
	
	self methodToBeTested: (IPTGame >> #keyUp:).

	{$W.$S} do: [ :key |
		game playerLeft up.
		game playerRight up.
		prevSpeed := game playerRight speed.
		game keyUp: (KeyboardEvent new keyValue: key).
		self assert: (prevSpeed = game playerRight speed) description: 'The right player should not be affected by letting go of ', key, '.'.
		self assert: (game playerLeft speed = 0) description: 'The left player should stop when letting go of ', key, '.'.
		
		game playerLeft up.
		game keyUp: (KeyboardEvent new keyValue: key asLowercase).
		self assert: (game playerLeft speed = 0) description: 'The left player should also stop when letting go of ', key, '.'].
	
	{Character arrowUp. Character arrowDown} do: [ :key |
		game playerLeft up.
		game playerRight up.
		prevSpeed := game playerLeft speed.
		game keyUp: (KeyboardEvent new keyValue: key).
		self assert: (prevSpeed = game playerLeft speed) description: 'The left player should not be affected by letting go of ', 
			(key = Character arrowUp ifTrue: ['arrowUp'] ifFalse: ['arrowDown']), '.'.
		self assert: (game playerRight speed = 0) description: 'The right player should stop when letting go of ',
			(key = Character arrowUp ifTrue: ['arrowUp'] ifFalse: ['arrowDown']), '.'].
	
]
