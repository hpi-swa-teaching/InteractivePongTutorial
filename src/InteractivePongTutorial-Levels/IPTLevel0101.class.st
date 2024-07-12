"
This class contains the informations for Level 1 in Chapter 1. It is a Subclass of IPTLevel.
"
Class {
	#name : #IPTLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:24'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:07'
}
IPTLevel0101 class >> asString [

	^ 'Level 01: Intro'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'sv 7/12/2024 19:12'
}
IPTLevel0101 class >> description [
	
	^ 'In this Level, you will get an introduction to the tutorial and learn about basic Morph methods.'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/11/2024 14:58'
}
IPTLevel0101 class >> explanations [

	^ {
	'Welcome to the Browser of the Interactive Pong Tutorial. You can edit and test your code here. You can switch between levels of the same chapter using the buttons on the top right.'.
	'In the treeview on the left, you can see all available classses and methods. You can test your code with the play button in the bottom left. If your code is correct, it will be shown in the center'.
	'In this level the only method you need to change is IPTGame>>#initialize. The method with the name initialize will allways be executed when creating a new object of a class. The Game itself is a subclass of Morph and contains all elements of Pong.'.
	'But what is a Morph? Morph is a class used to visualize objects in Squeak. Since IPTGame is a subclass of Morph, it can use all its methods'.
	'Morphs have a lot of properties that can be changed, for example the position, color and its size (extent). Right now our game has the color blue, which isnt really an appropriate background color for pong. Or is it?'.
	}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/11/2024 08:52'
}
IPTLevel0101 class >> levelIndex [

	^ 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 15:34'
}
IPTLevel0101 class >> visibleMethods [

	^ {IPTGame>>#initialize}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'sv 7/12/2024 19:05'
}
IPTLevel0101 >> testGameInitialize [

	self methodToBeTested: (IPTGame >> #initialize).
	
	self requiredAssert: (game isKindOf: IPTGame) description: 'You may not return a value!'.
	
	self assert: game color isNil not description: 'Have you initialized the morph?'.
	self assert: (game color = Color black) description: 'You did not choose the right color!'.
]
