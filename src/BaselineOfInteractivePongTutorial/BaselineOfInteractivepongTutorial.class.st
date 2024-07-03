Class {
	#name : #BaselineOfInteractivepongTutorial,
	#superclass : #BaselineOf,
	#category : #BaselineOfInteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/3/2024 09:35'
}
BaselineOfInteractivepongTutorial >> baseline: spec [
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
