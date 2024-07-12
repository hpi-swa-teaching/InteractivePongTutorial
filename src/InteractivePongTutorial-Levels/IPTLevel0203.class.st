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
	#'squeak_changestamp' : 'sv 7/12/2024 19:13'
}
IPTLevel0203 class >> description [
	
	^ 'In this Level, you will make the player react to keyboard input.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FH 7/10/2024 18:00'
}
IPTLevel0203 class >> explanations [
	
	^ {''.}.
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
	#'squeak_changestamp' : 'sv 7/12/2024 19:01'
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
	
	{Character arrowUp . Character arrowDown} do: [ :key |
		game playerLeft up.
		game playerRight up.
		prevSpeed := game playerLeft speed.
		game keyUp: (KeyboardEvent new keyValue: key).
		self assert: (prevSpeed = game playerLeft speed) description: 'The left player should not be affected by letting go of ', 
			(key = Character arrowUp
				ifTrue: ['arrowUp']
				ifFalse: ['arrowDown']),
			'.'.
		self assert: (game playerRight speed = 0) description: 'The right player should stop when letting go of ',
			(key = Character arrowUp
				ifTrue: ['arrowUp']
				ifFalse: ['arrowDown']),
			'.'].
	
]
