Class {
	#name : #IPTSqueaky,
	#superclass : #Morph,
	#instVars : [
		'image'
	],
	#category : #'InteractivePongTutorial-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 17:31'
}
IPTSqueaky >> drawOn: aCanvas [
    | bounds scaledImage |
    bounds := self bounds.
    
    "Draw white background"
    aCanvas fillRectangle: bounds color: Color white.
    
    "Scale and draw the image"
    image ifNotNil: [
        scaledImage := image scaledToSize: bounds extent.
        aCanvas drawImage: scaledImage at: bounds topLeft.
    ].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 6/30/2024 17:30'
}
IPTSqueaky >> initialize [
    super initialize.
    image := Form fromFileNamed: 'path/to/your/image.png'.
]
