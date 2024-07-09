Class {
	#name : #IPTSqueaky,
	#superclass : #ImageMorph,
	#instVars : [
		'mood'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 19:06'
}
IPTSqueaky >> drawOn: aCanvas [
	
	self updateImage.
	aCanvas fillRectangle: self owner bounds color: Color white.
	aCanvas drawImage: self image at: (self innerBounds origin + (self owner extent - self image extent / 2)).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:33'
}
IPTSqueaky >> mood [
	^ mood
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 19:02'
}
IPTSqueaky >> mood: aSelector [
	mood := aSelector.
	self updateImage.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 18:18'
}
IPTSqueaky >> setImageFromPath: anImagePath [
	
	self image: ((GitAssetLoader for: 'InteractivePongTutorial')
				loadForm: anImagePath).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 17:35'
}
IPTSqueaky >> squeakyPaths [
	^ Dictionary new 
		at: #sad put: 'assets/squeaky-sad.png';
		at: #happy put: 'assets/squeaky-happy.png';
		at: #neutral put: 'assets/squeaky-neutr.png';
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 19:04'
}
IPTSqueaky >> updateImage [

	self setImageFromPath: (self squeakyPaths at: self mood).
	self owner ifNotNil: [
		self image: (self image scaledToHeight: self owner height).
		(self image width > self owner width) ifTrue: 
			[self image: (self image scaledToWidth: self owner width)]].

	

]
