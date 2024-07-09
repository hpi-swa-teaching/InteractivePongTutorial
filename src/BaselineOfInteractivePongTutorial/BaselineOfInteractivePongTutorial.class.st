Class {
	#name : #BaselineOfInteractivePongTutorial,
	#superclass : #BaselineOf,
	#category : #BaselineOfInteractivePongTutorial
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 10:46'
}
BaselineOfInteractivePongTutorial >> baseline: spec [
	<baseline>
	    spec
	        for: #'common'
	        do: [
			spec
				baseline: 'Squot' with: [
				spec repository: 'github://hpi-swa/Squot:mapper/src'. ].
            	spec
			   	package: 'InteractivePongTutorial-Game';   
				package: 'InteractivePongTutorial-Levels' with: [spec requires: #('InteractivePongTutorial-Game')];             
			   	package: 'InteractivePongTutorial-Core' with: [spec requires: #('Squot' 'InteractivePongTutorial-Levels' 'InteractivePongTutorial-Game'); postLoadDoIt: #postLoad];
	      		package: 'InteractivePongTutorial-Tests' with: [spec requires: #('default')];
	                yourself.
	            spec
			    group: 'default' with: #('InteractivePongTutorial-Core' 'InteractivePongTutorial-Game' 'InteractivePongTutorial-Levels');
	                group: 'tests' with: #('InteractivePongTutorial-Tests');
	                yourself].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Josua Zehner 7/9/2024 10:49'
}
BaselineOfInteractivePongTutorial >> postLoad [
]
