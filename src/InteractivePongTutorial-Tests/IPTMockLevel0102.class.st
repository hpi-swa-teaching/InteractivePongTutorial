Class {
	#name : #IPTMockLevel0102,
	#superclass : #IPTLevel,
	#category : #'InteractivePongTutorial-Tests'
}

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:10'
}
IPTMockLevel0102 class >> asString [
	
	^ 'Mocklevel 02'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:11'
}
IPTMockLevel0102 class >> description [
	
	^ 'Mocklevel 02 description'.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:08'
}
IPTMockLevel0102 class >> explanations [
	
	^ {'explanation 1'. 'explanation 2'}.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:11'
}
IPTMockLevel0102 class >> levelIndex [

	^ 2.
]

{
	#category : #information,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:09'
}
IPTMockLevel0102 class >> visibleMethods [

	^ {IPTMockClass>>#mockMethod}.
]

{
	#category : #levelTests,
	#'squeak_changestamp' : 'Josua Zehner 7/10/2024 14:06'
}
IPTMockLevel0102 >> testMockMethod [
	
	self assert: IPTMockClass new mockMethod description: 'mockMethod not changed'.
]
