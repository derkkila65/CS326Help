'From Cuis 6.0 [latest update: #5069] on 6 April 2022 at 9:06:48 pm'!
'Description '!
!provides: 'CS326-TaskManager' 1 2!
!requires: 'Identities-UUID' 1 9 nil!
!requires: 'CS326-Core' 1 1 nil!
SystemOrganization addCategory: 'CS326-TaskManager'!


!classDefinition: #Developer category: 'CS326-TaskManager'!
Entity subclass: #Developer
	instanceVariableNames: 'developerName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-TaskManager'!
!classDefinition: 'Developer class' category: 'CS326-TaskManager'!
Developer class
	instanceVariableNames: ''!

!classDefinition: #Task category: 'CS326-TaskManager'!
Entity subclass: #Task
	instanceVariableNames: 'name description developer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CS326-TaskManager'!
!classDefinition: 'Task class' category: 'CS326-TaskManager'!
Task class
	instanceVariableNames: ''!


!Task methodsFor: 'accessing' stamp: 'TE 4/3/2022 23:24:38'!
name
	"Provide the name of the task"

	^ name! !

!Developer methodsFor: 'accessing' stamp: 'TE 4/6/2022 12:32:37'!
developerName
	"Provide the name of the developer"

	^ developerName! !

!Developer methodsFor: 'accessing' stamp: 'TE 4/6/2022 12:32:02'!
developerName: anObject
	"Set the name of a developer"

	developerName _ anObject! !

!Developer methodsFor: 'visiting' stamp: 'TE 4/6/2022 12:33:19'!
accept: aVisitor

	^aVisitor visitDeveloper: self! !

!Developer class methodsFor: 'instance creation' stamp: 'TE 4/6/2022 20:55:55'!
developerName: aString

	^self new
		developerName: aString;
		yourself! !

!Task methodsFor: 'accessing' stamp: 'TE 4/3/2022 23:23:15'!
description
	"Describe the task at hand"

	^ description! !

!Task methodsFor: 'accessing' stamp: 'TE 4/3/2022 23:28:26'!
description: anObject
	"Set the description of a task"

	description _ anObject! !

!Task methodsFor: 'accessing' stamp: 'TE 4/6/2022 20:17:12'!
developer
	"Provide the name of the developer on the task"

	^ developer! !

!Task methodsFor: 'accessing' stamp: 'TE 4/6/2022 20:19:58'!
developer: anObject
	"Set the developer"

	developer _ anObject! !

!Task methodsFor: 'accessing' stamp: 'TE 4/3/2022 23:28:44'!
name: anObject
	"Set the name of a task"

	name _ anObject! !

!Task methodsFor: 'visiting' stamp: 'TE 4/3/2022 23:37:16'!
accept: aVisitor

	^aVisitor visitTask: self! !

!Task class methodsFor: 'instance creation' stamp: 'TE 4/6/2022 21:06:15'!
name: aString
description: aDescription
developer: Developer

	^self new
		name: aString;
		description: aDescription;
		developer: Developer;
		yourself! !
