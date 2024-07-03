Class {
	#name : #IPTLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 16:47'
}
IPTLevel0101 class >> asString [

	^ 'Level 01: Intro'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 6/21/2024 17:48'
}
IPTLevel0101 class >> description [
	
	^ 'In this level, you will get Introduced to the Tutorial and learn about basic Morph methods.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/2/2024 11:15'
}
IPTLevel0101 class >> explanations [

	^ {
	'Welcome to the Browser of the Interactive Pong Tutorial. You can edit and test your code here. You can switch between levels of the same chapter using the buttons on the top right.'.
	'In the treeview on the left you can see all available classses and methods. You can test your code with the play button in the bottom left, if your code is correct, it will be shown in the center'.
	'In this level the only method you need to change is IPTGame>>#initialize. The method with the name initialize will allways be executed when creating a new object of a class. The Game itself is a subclass of Morph and contains all elements of Pong.'.
	'But what is a Morph? Morph is a class used to visualize objects in Squeak. Since IPTGame is a subclass of Morph, it can use all its methods'.
	'Morphs have a lot of properties that can be changed, for example the position, color and its size (extent). Right now our game has the color blue which isnt really an appropriate background color for pong, is it?'.
	}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 6/19/2024 12:15'
}
IPTLevel0101 class >> levelIndex [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 15:01'
}
IPTLevel0101 class >> visibleMethods [

	^ {IPTMethodSelector make: IPTGame >> #initialize readOnly: false}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Felix Knöfel 7/3/2024 11:30'
}
IPTLevel0101 >> test_Game_initialize [
	self methodToBeTested: (IPTGame >> #initialize).
	
	self assert: (game isKindOf: IPTGame) description: 'You may not return a value!'.
	self assert: game color isNil not description: 'Have you initialized the morph?'.
	self assert: (game color = Color black) description: 'You did not choose the right color!'.
]
