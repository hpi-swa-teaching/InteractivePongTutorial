Class {
	#name : #BaselineOfInteractivePongTutorial,
	#superclass : #BaselineOf,
	#instVars : [],
	#category : #'BaselineOfInteractivePongTutorial'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Felix Knöfel 7/1/2024 13:57'
}
BaselineOfInteractivePongTutorial class >> baseline: spec [
   <baseline>
    spec
        for: #'common'
        do: [
            spec
                package: 'InteractivePongTutorial-Core';
                package: 'InteractivePongTutorial-Core-Tests' with: [spec requires: #('core' 'levels')];
                yourself.
            spec
                group: 'core' with: #('InteractivePongTutorial-Core');
		    group: 'levels' with: #('InteractivePongTutorial-Levels');
                group: 'tests' with: #('InteractivePongTutorial-Core-Tests');
                yourself].
]
