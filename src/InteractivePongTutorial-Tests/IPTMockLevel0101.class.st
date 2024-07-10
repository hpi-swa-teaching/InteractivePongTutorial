Class {
	#name : #IPTMockLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:07'
}
IPTMockLevel0101 class >> asString [
	
	^ 'Mocklevel 01'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:07'
}
IPTMockLevel0101 class >> description [
	
	^ 'Mocklevel 01 description'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:08'
}
IPTMockLevel0101 class >> explanations [
	
	^ {'explanation 1'. 'explanation 2'}.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:08'
}
IPTMockLevel0101 class >> levelIndex [

	^ 1.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:09'
}
IPTMockLevel0101 class >> visibleMethods [

	^ {IPTMockClass>>#mockMethod}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:06'
}
IPTMockLevel0101 >> testMockMethod [
	
	self assert: IPTMockClass new mockMethod description: 'mockMethod not changed'.
]
