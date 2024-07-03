Class {
	#name : #BaselineOfInteractivePongTutorial,
	#superclass : #BaselineOf,
	#category : #BaselineOfInteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 10:27'
}
BaselineOfInteractivePongTutorial >> baseline: spec [
	<baseline>
	    spec
	        for: #'common'
	        do: [
	            spec
	                package: 'InteractivePongTutorial-Core';
	                package: 'InteractivePongTutorial-Core-Tests' with: [spec requires: #('default')];
	                yourself.
	            spec
	                group: 'default' with: #('InteractivePongTutorial-Core');
	                group: 'tests' with: #('InteractivePongTutorial-Core-Tests');
	                yourself].
]
