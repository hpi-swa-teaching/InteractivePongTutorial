"
This class contains the Squeaky images and Displays it.
"
Class {
	#name : #IPTSqueaky,
	#superclass : #ImageMorph,
	#instVars : [
		'mood'
	],
	#category : #'InteractivePongTutorial-Core',
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 11:17'
}

{
	#category : #displaying,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 19:06'
}
IPTSqueaky >> drawOn: aCanvas [
	
	self updateImage.
	aCanvas fillRectangle: self owner bounds color: Color white.
	aCanvas drawImage: self image at: (self innerBounds origin + (self owner extent - self image extent / 2)).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:24'
}
IPTSqueaky >> mood [

	^ mood.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:24'
}
IPTSqueaky >> mood: aSelector [

	mood := aSelector.
	self updateImage.
]

{
	#category : #displaying,
	#'squeak_changestamp' : 'Felix Knöfel 7/10/2024 12:29'
}
IPTSqueaky >> setImageFromPath: anImagePath [
	
	self image: ((GitAssetLoader for: 'InteractivePongTutorial') loadForm: anImagePath).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Leo Sonnenberg 7/10/2024 14:23'
}
IPTSqueaky >> squeakyPaths [

	^ Dictionary new 
		at: #sad put: 'assets/squeaky-sad.png';
		at: #happy put: 'assets/squeaky-happy.png';
		at: #neutral put: 'assets/squeaky-neutr.png';
		yourself.
]

{
	#category : #displaying,
	#'squeak_changestamp' : 'sv 7/12/2024 18:45'
}
IPTSqueaky >> updateImage [

	self setImageFromPath: (self squeakyPaths at: self mood).
	self owner ifNotNil: [ :owner |
		self image: (self image scaledToHeight: owner height).
		(self image width > owner width)
			ifTrue: [self image: (self image scaledToWidth: owner width)]].

	

]
