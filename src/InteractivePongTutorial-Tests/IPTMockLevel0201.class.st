Class {
	#name : #IPTMockLevel0201,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:11'
}
IPTMockLevel0201 class >> asString [
	
	^ 'Mocklevel 01'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:07'
}
IPTMockLevel0201 class >> description [
	
	^ 'Mocklevel 01 description'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:08'
}
IPTMockLevel0201 class >> explanations [
	
	^ {'explanation 1'. 'explanation 2'}.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:08'
}
IPTMockLevel0201 class >> levelIndex [

	^ 1.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:09'
}
IPTMockLevel0201 class >> visibleMethods [

	^ {IPTMockClass>>#mockMethod}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:06'
}
IPTMockLevel0201 >> testMockMethod [
	
	self assert: IPTMockClass new mockMethod description: 'mockMethod not changed'.
]
