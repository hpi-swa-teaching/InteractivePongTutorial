Class {
	#name : #IPTMockLevel0101,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Levels'
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
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:04'
}
IPTMockLevel0101 class >> visibleMethods [

	^ {IPTMockGame>>#mockMethod}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 15:27'
}
IPTMockLevel0101 >> testMockMethod [
	
	self methodToBeTested: (IPTMockGame >> #mockMethod).
	self assert: IPTMockGame new mockMethod = true description: 'mockMethod not changed'.
]
